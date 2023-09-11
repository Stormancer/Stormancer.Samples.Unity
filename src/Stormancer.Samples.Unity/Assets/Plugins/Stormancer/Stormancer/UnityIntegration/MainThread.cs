//using UnityEngine;
//using System;
//using System.Collections;
//using System.Collections.Generic;
//using System.Collections.Concurrent;
//using System.Threading.Tasks;
//using System.Threading;

//namespace Stormancer
//{
//    public class MainThread : MonoBehaviour
//    {
//        public static void Post(Action action)
//        {
//            if (_instance != null)
//            {
//                //if (!_isAppQuitting)
//                //{
//                    Instance.PostImpl(action);
//                //}
//            }
//            else if (!_isAppQuitting)
//            {
//                throw new InvalidOperationException("Please use StormancerActionHandler.Initialize() in a behaviour before posting actions.");
//            }
//        }

//        public static void DoStartCoroutine(IEnumerator coroutine)
//        {
//            MainThread.Instance.StartCoroutine(coroutine);
//        }

//        private static MainThread _instance;

//        private static MainThread Instance => _instance;

//        private static bool _isAppQuitting = false;
//        private ConcurrentQueue<Action> _actionQueue = new ConcurrentQueue<Action>();

//        private void PostImpl(Action action)
//        {
//            if(Thread.CurrentThread == _mainThread)
//            {
//                action();
//            }
//            else if (!_isAppQuitting)
//            {
//                _actionQueue.Enqueue(action);
//            }
//        }

//        /// <summary>
//        /// reset the action queue by create a new one
//        /// </summary>
//        public static void ResetActions()
//        {
//           if( _instance != null)
//            {
//                _instance._actionQueue = new ConcurrentQueue<Action>();
//            }
//        }

//        public static void Initialize()
//        {
//            if (_instance == null)
//            {
//                GameObject go = new GameObject();
//                _instance = go.AddComponent<MainThread>();
//                go.name = "MainThread";
//                DontDestroyOnLoad(go);
//            }
//        }

//        private static Thread _mainThread = Thread.CurrentThread;

//        void Update()
//        {
//            Action temp;
//            while (_isAppQuitting == false && _actionQueue.TryDequeue(out temp))
//            {
//                if (temp != null)
//                {
//                    temp();
//                }
//            }
//        }

//        void OnApplicationQuit()
//        {
//            _isAppQuitting = true;
//        }

//        // 
//        public static Coroutine StartCoroutineFromEnumerator(IEnumerator e)
//        {
//            return Instance.StartCoroutine(e);
//        }

//        internal static Coroutine CoroutineFromTask(Task task)
//        {
//            return Instance.StartCoroutine(Instance.CoroutineFromTaskImpl(task));
//        }

//        private IEnumerator CoroutineFromTaskImpl(Task task)
//        {
//            while (!task.IsCompleted)
//            {
//                yield return null;
//            }
//        }
//    }
//}
