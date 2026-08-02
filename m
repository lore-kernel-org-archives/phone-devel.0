Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114A623394E
	for <phone-devel@vger.kernel.org>; Sun,  2 Aug 2026 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785673386; cv=none; b=p5WUCJIrBUhcWUfnyfqMd6mAeyKFyUuZF/e9B9UGmudgFw05waUEqClFEl2quiykD7qKh1bEo3q4w0p/MWrjVV8mnE8tv10ouhflJfzmkWR2lon3GSt3DZIzdcx9gc3nBDeXSTTU47cg0vZwA3lnKkLyxgE5+0kyy8TcyiGLYas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785673386; c=relaxed/simple;
	bh=btEAofBqbPs4lIfMsEMPgdS7qc+jMsnM2+pzmrvtpDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OR2V0pInOSbstHdFczTIk4EwbEQ7VZ+YW5Xz2x8bPPUH2IHoLFROZMn+wTzSP9VXsv2XsIg/xkYZx4+T9EVdaD1qgwZymLTNZVeZBLfmsocKoe1yx4bTp/zVSUGQviXRBSmEba/1dplc1ME37h2gdhFIkO58OrnWwSFOeNgA6Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQY9EQm6; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQY9EQm6"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c74722e27so29412351fa.0
        for <phone-devel@vger.kernel.org>; Sun, 02 Aug 2026 05:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785673383; x=1786278183; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CpT+FgkcorYOYwnPqETssYy39Xr51dI1NIkn0lwblN8=;
        b=KQY9EQm6u56FfBJQJPVYKsOJ7519z46xJc/JfmhkGgHSWwZ4T4zXMWlyLFl5dy3mUC
         MukfyS7Cml/7w4RRQklC6hJUNsSc84YYY8sWs0LLue42MN2VEWHLnmgixs0+KBwaVysb
         SIt8ye1Uv/GTbJl63BRBi4zBj+UNaf7iswFwPiyvWh8D5hIzKGBhJ990XhncliPU0CVO
         sDX/CqYZ/cffRm2nvVfz4CC0ezcyZe0bafHSN2w6G+do6lS6nKbR7FONZ3fGR6mXpPDO
         mbehidXtZVqTGaN/BlVzapxuJFPtyjrP9zuV+BUTxiKQOw9/l0bDPHGdfzeSMw7dhZMW
         xMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785673383; x=1786278183;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CpT+FgkcorYOYwnPqETssYy39Xr51dI1NIkn0lwblN8=;
        b=ksgApZ7ZNa71IeAZhIbn5XCLS2YyiugymhFYn88L9bKQb8siyny2h9HAPXzHdau76a
         RTChJ+mMd+iUh7bAMWaOibryX94TuPl2Hbw05ldQH2BNVmVwCcmYUt5zBFTWhRBPn1DF
         Y1O0FKuf3ZVnQ74B/gcbatiS0FViG5/ChzCHT//Tw4jcEQW/nsmeQpwMH0DwvsTjhuKv
         FWCAjFS+Dv+rCoU6yfYyPS4Wh8hTX9OJ9tqnwqN7cT46HT7iYvzSJ/VqqnQQnq6v2y+I
         wFo7m5S6mPb4WcfplTPu1sHQTo4cAOULcg4JMsIxDqhOjo/+90RJ/cgd6MqpTc1Wm2P5
         /K+g==
X-Forwarded-Encrypted: i=1; AHgh+RpC0O9AkQFfn7Kn+sZqWCgwb5vj9jLN2/K92PyofPUNR9yjl1RAAVOlyTqODhzqINaJ0X2MMKCvHiz7BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ2dc0IrC53zy86GnOCvTnqXe4XWV35Ca6zorLH9CJAEHsz5lh
	MGpoOEcfA3MQ7uvcLAhftcWsFXEXvq6ChhFkz+IoyD3AHzM1b2P5C+D0
X-Gm-Gg: AR+sD100Dkf43S/9jTspowxIt/ETrtXJf0u+hDN8WhTV6Gm4XuauHkEVvPI3CPvSKbc
	QKreUdloHN+7cBWU9rXQ7WPlqU5bE0rhbzD7kWwJEfpKUUhXfHZCcvxVF705Zj9EnX1pGCzrWK4
	ksKeZ/awrYrZU92uCLpXek9wGQN6vxL2HmyzkLPglgbogkOypTzCpMF7LYua6QcYQsT85iu+ean
	NyVstPqXBlbeo5uSOYn+5vEh84PV0Jj6/asAK8kQYBMjUgO/eEjCHaQHhJhwmhABptF79YJh18O
	4bBE3iO0XPZEpbHyFoNqkuyrGMLz9BIRVjSPJmvkSVa/L8ZN9scloS0zCwN6FcMtxvJrul2vdhL
	+r85sedmfVR7at9BHEeAr6heutBEA9BnnmBYeoiqqewvSpeoOKPwHuVFnYfNZ1Ediz7ONc13Cbm
	DkkJjfJVuXS0ZPpGL+0+lHym1CozHNh3IjI2bnBZT5IAxVgMlp4/KkNpy3
X-Received: by 2002:a2e:b8ca:0:b0:39d:560a:faa with SMTP id 38308e7fff4ca-39f7eaa5c8cmr16169101fa.16.1785673382926;
        Sun, 02 Aug 2026 05:23:02 -0700 (PDT)
Received: from [192.168.1.139] ([2001:9b1:c9c3:6900::69b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f813074aesm8316791fa.37.2026.08.02.05.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:23:01 -0700 (PDT)
From: Stefan Hansson <newbie13xd@gmail.com>
X-Google-Original-From: Stefan Hansson <newbyte@postmarketos.org>
Date: Sun, 02 Aug 2026 14:22:57 +0200
Subject: [PATCH] wifi: rsi: Fix types to appease CFI
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-rsi-cfi-fix-v1-1-5821d2cb54ee@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAKA2b2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMj3aLiTN3ktEzdtMwKXSMDAwvTJDNL4xQjIyWgjoKiVKAw2LToWAi
 /uDQpKzW5BGSEUm0tACMoSyVvAAAA
X-Change-ID: 20260802-rsi-cfi-fix-20085b693d22
To: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc: Stefan Hansson <newbyte@postmarketos.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5262;
 i=newbyte@postmarketos.org; h=from:subject:message-id;
 bh=btEAofBqbPs4lIfMsEMPgdS7qc+jMsnM2+pzmrvtpDE=;
 b=owGbwMvMwCG25kZIp7bFjRmMp9WSGLLyzZZkbGrKlq+fuE2t2DSIyYPDKfmN1OZ7kxfPP/Axd
 VfD0T06HaUsDGIcDLJiiixtPrJbm0S+zWmU118EM4eVCWQIAxenAEykfA/D/0qlunc7Pp9cwLq2
 97FHWM+XG51ROypWOa2pD990m09w6wuGv5Jzxb5fDDjUbDonS/C75l+mCbKxr7J37te5V7T6RHF
 jLRcA
X-Developer-Key: i=newbyte@postmarketos.org; a=openpgp;
 fpr=864C1DB58214F69C811F2FA2ACD854892B38D898

Avoids errors like:

    CFI failure at kthread+0x124/0x1cc (target: rsi_coex_scheduler_thread+0x0/0x1b4 [redpine_91x]; expected type: 0x89fb613d)

As seen in the aforementioned error this was tested using the downstream
redpine_91x driver found in the Librem 5's downstream source tree.
However, it appears that this driver is a modified version of the rsi
driver found in mainline Linux and as such I decided to port the changes
here too.

Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
---
 drivers/net/wireless/rsi/rsi_91x_coex.c     | 3 ++-
 drivers/net/wireless/rsi/rsi_91x_main.c     | 5 +++--
 drivers/net/wireless/rsi/rsi_91x_sdio_ops.c | 3 ++-
 drivers/net/wireless/rsi/rsi_91x_usb_ops.c  | 3 ++-
 drivers/net/wireless/rsi/rsi_common.h       | 2 +-
 drivers/net/wireless/rsi/rsi_sdio.h         | 2 +-
 drivers/net/wireless/rsi/rsi_usb.h          | 2 +-
 7 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_coex.c b/drivers/net/wireless/rsi/rsi_91x_coex.c
index ee603a5173fb..023c539fc384 100644
--- a/drivers/net/wireless/rsi/rsi_91x_coex.c
+++ b/drivers/net/wireless/rsi/rsi_91x_coex.c
@@ -50,8 +50,9 @@ static void rsi_coex_sched_tx_pkts(struct rsi_coex_ctrl_block *coex_cb)
 	} while (coex_q != RSI_COEX_Q_INVALID);
 }
 
-static void rsi_coex_scheduler_thread(struct rsi_common *common)
+static int rsi_coex_scheduler_thread(void *data)
 {
+	struct rsi_common *common = data;
 	struct rsi_coex_ctrl_block *coex_cb = common->coex_cb;
 	u32 timeout = EVENT_WAIT_FOREVER;
 
diff --git a/drivers/net/wireless/rsi/rsi_91x_main.c b/drivers/net/wireless/rsi/rsi_91x_main.c
index 662e42d1e5e8..61db2b363d11 100644
--- a/drivers/net/wireless/rsi/rsi_91x_main.c
+++ b/drivers/net/wireless/rsi/rsi_91x_main.c
@@ -246,12 +246,13 @@ EXPORT_SYMBOL_GPL(rsi_read_pkt);
 /**
  * rsi_tx_scheduler_thread() - This function is a kernel thread to send the
  *			       packets to the device.
- * @common: Pointer to the driver private structure.
+ * @data: Pointer to the driver private structure.
  *
  * Return: None.
  */
-static void rsi_tx_scheduler_thread(struct rsi_common *common)
+static int rsi_tx_scheduler_thread(void *data)
 {
+	struct rsi_common *common = data;
 	struct rsi_hw *adapter = common->priv;
 	u32 timeout = EVENT_WAIT_FOREVER;
 
diff --git a/drivers/net/wireless/rsi/rsi_91x_sdio_ops.c b/drivers/net/wireless/rsi/rsi_91x_sdio_ops.c
index 597b238e2294..18a28aa97446 100644
--- a/drivers/net/wireless/rsi/rsi_91x_sdio_ops.c
+++ b/drivers/net/wireless/rsi/rsi_91x_sdio_ops.c
@@ -62,8 +62,9 @@ int rsi_sdio_master_access_msword(struct rsi_hw *adapter, u16 ms_word)
 
 static void rsi_rx_handler(struct rsi_hw *adapter);
 
-void rsi_sdio_rx_thread(struct rsi_common *common)
+int rsi_sdio_rx_thread(void *data)
 {
+	struct rsi_common *common = data;
 	struct rsi_hw *adapter = common->priv;
 	struct rsi_91x_sdiodev *sdev = adapter->rsi_dev;
 
diff --git a/drivers/net/wireless/rsi/rsi_91x_usb_ops.c b/drivers/net/wireless/rsi/rsi_91x_usb_ops.c
index 25c2b232394a..513d2fdfb510 100644
--- a/drivers/net/wireless/rsi/rsi_91x_usb_ops.c
+++ b/drivers/net/wireless/rsi/rsi_91x_usb_ops.c
@@ -25,8 +25,9 @@
  *
  * Return: None.
  */
-void rsi_usb_rx_thread(struct rsi_common *common)
+int rsi_usb_rx_thread(void *data)
 {
+	struct rsi_common *common = data;
 	struct rsi_hw *adapter = common->priv;
 	struct rsi_91x_usbdev *dev = adapter->rsi_dev;
 	int status;
diff --git a/drivers/net/wireless/rsi/rsi_common.h b/drivers/net/wireless/rsi/rsi_common.h
index 3cdf9ded876d..2a33a81f71a3 100644
--- a/drivers/net/wireless/rsi/rsi_common.h
+++ b/drivers/net/wireless/rsi/rsi_common.h
@@ -58,7 +58,7 @@ static inline void rsi_reset_event(struct rsi_event *event)
 
 static inline int rsi_create_kthread(struct rsi_common *common,
 				     struct rsi_thread *thread,
-				     void *func_ptr,
+				     int (*func_ptr)(void *data),
 				     u8 *name)
 {
 	init_completion(&thread->completion);
diff --git a/drivers/net/wireless/rsi/rsi_sdio.h b/drivers/net/wireless/rsi/rsi_sdio.h
index 7c91b126b350..eb2b7f36a7e4 100644
--- a/drivers/net/wireless/rsi/rsi_sdio.h
+++ b/drivers/net/wireless/rsi/rsi_sdio.h
@@ -134,5 +134,5 @@ int rsi_sdio_master_access_msword(struct rsi_hw *adapter, u16 ms_word);
 void rsi_sdio_ack_intr(struct rsi_hw *adapter, u8 int_bit);
 int rsi_sdio_determine_event_timeout(struct rsi_hw *adapter);
 int rsi_sdio_check_buffer_status(struct rsi_hw *adapter, u8 q_num);
-void rsi_sdio_rx_thread(struct rsi_common *common);
+int rsi_sdio_rx_thread(void *data);
 #endif
diff --git a/drivers/net/wireless/rsi/rsi_usb.h b/drivers/net/wireless/rsi/rsi_usb.h
index 961851748bc4..78067eaffe8b 100644
--- a/drivers/net/wireless/rsi/rsi_usb.h
+++ b/drivers/net/wireless/rsi/rsi_usb.h
@@ -81,5 +81,5 @@ static inline int rsi_usb_event_timeout(struct rsi_hw *adapter)
 	return EVENT_WAIT_FOREVER;
 }
 
-void rsi_usb_rx_thread(struct rsi_common *common);
+int rsi_usb_rx_thread(void *data);
 #endif

---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260802-rsi-cfi-fix-20085b693d22

Best regards,
--  
Stefan Hansson <newbyte@postmarketos.org>

