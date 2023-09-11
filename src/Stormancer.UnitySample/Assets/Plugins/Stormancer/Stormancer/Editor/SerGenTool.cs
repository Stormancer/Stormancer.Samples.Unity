#if UNITY_EDITOR
using UnityEngine;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.IO;
using System.Linq;
using System.Text;
using Stormancer;
using UnityEditor;
using MsgPack.Serialization;

//[InitializeOnLoad]
public class SerGenTool
{
    static readonly string MsgpackserializerFilepath = Application.dataPath + @"\Stormancer\Stormancer\Stormancer.Unity\Infrastructure\MsgPackSerializer.cs";
    static readonly string OutputDirectory = Application.dataPath + @"\Stormancer\Stormancer\Specific";

    [MenuItem("Stormancer/Tools/Generate Serializer")]
    static void GenerateSerializer()
    {
        string finalNamespace = "GeneratedSerializers";
        ClearSerializer();

        string relativePathAssemblyDll = Application.dataPath + @"\..\Library\ScriptAssemblies\Assembly-CSharp.dll";
        var assembly = Assembly.LoadFile(relativePathAssemblyDll);

        Debug.Log("Generating Serializers...");
        try
        {
            //SerializerGenerator.GenerateCode(
            //  new SerializerCodeGenerationConfiguration
            //  {
            //      Namespace = finalNamespace,
            //      OutputDirectory = SerGenTool.OutputDirectory,
            //      EnumSerializationMethod = 0, // You can tweak it to use ByUnderlyingValue as you like.
            //      IsRecursive = true, // Set depenendent serializers are also generated.
            //      PreferReflectionBasedSerializer = false, // Set true if you want to use reflection based collection serializer, false if you want to get generated collection serializers.
            //      SerializationMethod = 0, // You tweak it to generate 'map' based serializers.
            //      IsInternalToMsgPackLibrary = true
            //  },
            //      assembly.GetTypes().Where(type => type.GetCustomAttributes(typeof(Stormancer.MsgPackDtoAttribute), true).Length > 0)
            //  );
            Debug.Log("Serializers generated");
        }
        catch (Exception exception)
        {
            Debug.LogWarning("Serializers generation failed :\n" + exception.Message);
        }

        Debug.Log("Editing MsgPackSerializer.cs file.");
        AddRegisterGeneratedSerializer(OutputDirectory, finalNamespace);
        Debug.Log("MsgPackSerializer.cs edited");

        Debug.Log("SerGen job done");

        AssetDatabase.Refresh();
    }

    [MenuItem("Stormancer/Tools/Clear serializer")]
    static void ClearSerializer()
    {
        string finalNamespace = "GeneratedSerializers";
        DeleteOldFiles(OutputDirectory, finalNamespace);
        //MsgPackSerializer.cs path
        List<string> lines;
        int startLine;
        int endLine;

        ParseFile(MsgpackserializerFilepath, out lines, out startLine, out endLine);

        if (endLine == -1 || startLine == -1)
        {
            Debug.LogError("#region GeneratedSerializers bad declared, abording edition of serialiazers registration file");
            return;
        }

        if (endLine - startLine > 1)
        {
            lines.RemoveRange(startLine + 1, endLine - startLine - 1);
        }

        File.WriteAllLines(MsgpackserializerFilepath, lines.ToArray());
    }

    private static void DeleteOldFiles(string OutputDirectory, string nameSpace)
    {
        Debug.Log("Clean output directory");
        var fullPath = OutputDirectory + "/" + nameSpace;
        if (Directory.Exists(fullPath))
        {
            Directory.Delete(fullPath, true);
        }
    }

    private static void AddRegisterGeneratedSerializer(string OutputDirectory, string nameSpace)
    {

        List<string> lines;
        int startLine;
        int endLine;

        ParseFile(MsgpackserializerFilepath, out lines, out startLine, out endLine);

        if (endLine == -1 || startLine == -1)
        {
            Debug.LogError("#region GeneratedSerializers bad declared, abording edition of serialiazers registration file");
            return;
        }

        if (endLine - startLine > 1)
        {
            lines.RemoveRange(startLine + 1, endLine - startLine - 1);
        }

        var outputDirectoryPath = OutputDirectory + "/" + nameSpace;
        var filesInDir = Directory.GetFiles(outputDirectoryPath, "*.cs");

        if (filesInDir.Count() > 0)
        {
            var generatedSerializers = filesInDir.Select(filename =>
            {
                return "\t\t\tRegisterSerializerFactory(ctx => new " + Path.GetFileNameWithoutExtension(filename) + "(ctx));";
            }).ToList();
            lines.InsertRange(startLine + 1, generatedSerializers);
        }

        File.WriteAllLines(MsgpackserializerFilepath, lines.ToArray());
    }

    private static void ParseFile(string path, out List<string> lines, out int startLine, out int endLine)
    {
        lines = File.ReadAllLines(path).ToList();
        startLine = -1;
        endLine = -1;

        int i = 0;
        while ((startLine == -1 || endLine == -1) && i < lines.Count)
        {
            if (lines[i].Contains("#endregion GeneratedSerializers"))
            {
                // if we did not find a start before
                // or if we already found a end
                if (startLine == -1 || endLine != -1)
                {
                    Debug.LogError("#region GeneratedSerializers bad declared, abording edition of serialiazers registration file");
                    return;
                }
                else
                {
                    endLine = i;
                }
            }
            else if (lines[i].Contains("#region GeneratedSerializers"))
            {
                if (startLine != -1)
                {
                    Debug.LogError("#region GeneratedSerializers bad declared, abording edition of serialiazers registration file");
                    return;
                }
                else
                {
                    startLine = i;
                }
            }
            i++;
        }
    }
}


#endif

