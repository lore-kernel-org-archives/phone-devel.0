Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466053;
	b=aIhnJjnWPyJ8V66z9FOqUdMDvQYw77kR5TGMU3wV8D6+HW3tzmjChcGq7hd96YwzLkBs
	 Pk6fFffQQCVBfg2KM2a/HMfqiyQe9fG/RrJnYwxBI5BQVqUFyI4I20bUSYI6Pd54COSFS
	 2rdLo/BnJ0pX9QFk7pzbYIAEec9TxLPk8Z8e/dPZ9DEkI1WZJuVEtUSfvd2pyCyXWiMIt
	 +e0Y4w2/vaXVUsL9MMekvhXinz/mtQgbXayStTEKpqCURTorTqh9NtaJSeu/fRufyS3V7
	 ePqmZc6DM+zcgr0gJpHFuS98Zci32LAvJbpC2Mxt0byOGGfEMXoJVx6WaKB23MuK+Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
	b=cVqtgyUtIvZKz7mZO8TiRcBRwpA5ggisjOd1PS2vQ/LP9hRv2yH6zuYb2f/mDMWWVrsr
	 a9AV3LXb9rZ/jjCpHOzFL078F5TnhkjGxQZCK4AjhrQ6Vu03sPRd8v6iEXy0mOqVbcIPK
	 4yyHTx2pjObU1Lq3ADxb++KZMkM+/m5KKJvMeCMJ/zXMdyDHcrFgHJONkcr2INqLzmz6s
	 awvP8iqpvBzMphC0cst6U71pX/RBeFB9H4u0MEFYDj0AdEJzpcX7XABpD60SkHhPx/X1Y
	 23HB5TGazeuijwKUVWUdmA5LH0PkOXKJsDVg7R5fi1RUsbjGYkTt63tAn2g1YNGXK8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9Lonnad;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD476606A69A
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD476606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9Lonnad
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso20714725e9.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466051; x=1796070851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
        b=j9LonnadtBhcTf4uh0U0BZsh53ugsoPcyeMsAx4M8zEVoUIQZWgx4sd536/f4ke42W
         lzpj1Ltt/hVcEt2NDsDcjBsjhL6TXdtnvHQMM6vxeTXSbmsmCnrbv9f2vKNLe2soN22A
         xBSpTQBvE0IWZwTBwqSReay0ZHWtXtnruWfGeur0k1HgM0c5idG2KW8x5QJpC4dNUx2D
         nLCHdA9w2UntGxU/xuBNR/F2HFG3eohxP+9a9N1MJF6/6vo9XkTN+coK4w3WIriaiLOu
         pPkMuVQgWIesEeKg7fWMjPwkWRDjfxCg5grGIMotONuHmg050PYWgRr4AFL7LyhxCeFn
         Pc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466051; x=1796070851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
        b=gg8cGxREG08+k8CtaEfWAKBF7nRsU3eJktzc31EvhxdewSYWco4mnozMQ7WjHQTj/P
         1jDR3PNBddPeshXbFaO/wrbqDCs5vnsFCSe9wms22VS+jF1IA8FBVGQ/P5m47PzcsSx1
         Igqzey/JvTPn/l/dsssTm01QQ+B9/abkweXGA8v1ny3rKThEyG8hNbG41JxDNUhNFUjL
         3avI2bR7ZH+ZKsgfIq73Mn9sXSSMu0wNTFh/giMi3930fsFC0v8HsViK6Lt22V4HOT8B
         87F3MFzsCTFGCh8SteM9CGAjh6YQVJyVuIh/7XvN9ffp8AshnG8rMv5AqkQjvpU9KMox
         ehag==
X-Forwarded-Encrypted: i=1; AL+hErEpShV1KE5O84qGvPtZ+pZOgjurk8xvnDCDwXShICfSdfkNDU6W4+2nGtrrnzhyRrZ8KYNrEoLbwuPUyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ohEm4Muc5GWzKiiyGTu7GnCZYdUHYde6XLJuI28N3P3Ttmfr6
	fVJJyzCwYGyiLYa3d9/1Okah/d+hvUKi0IEJnrI0ESViSSUPi7wZgrkh
X-Gm-Gg: AZFdTZdyLVXNyBJfnJqad41AtiySmkkqg4EtSVgfLTYvGE20Pa8YkBha3sXyBeGZr82
	2EILSYEz0ss7ZYfhNJffBxYSMCa5YZ0Qfrw7BF+NHIPRIrxpQQ9CP0CJ8esCWBUOLQDffJEY9xo
	Tayyvdfrro5kMHGEZLq9gQTVkIvJ1VA0GkCrIkwM050tQ5gneQQaqnOapwTpfCOiusrbG/YknyV
	6K58TEYB8cQGztgSYt9t4GfbE48qnEGYCvq5CBtFtzoCuZL9COso43P5OQ9rM2LDYcMSxHcXHHK
	Y+RHWFSOHyqDFxPJHfyiQLqHRhgmGE7orr6RSyv0DRpCuSt2uB0Y2qEDGtGjhecLdJMA07wqWpo
	tdnnKQIPSpkCsVQr+nljVnQMML34nfU0PIs1Vj2JhhgJracZ8gOfnBSYV097V71UJSHZU9VZYJQ
	ZF/siJ/h9yzydp3Hj38JRgkiuYbCVSLHoDx3BfHJ8LbHxyUsGcZLvgoLaQxaotDYCsDj5Mp9h3z
	avx7zZthROTd9hs9qVtXY0xvdH8AiG0yF2FjhjCgVwEfQuUKl2VuzpNChGJr5vQCaaXtDFcH2nM
	UIo17foBySvk2Cmww0RDONwtHmfyBYhrDLBnz/gD52FAuvf5On4=
X-Received: by 2002:a05:600c:1548:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb887fe7e0mr275033015e9.9.1795466051182;
        Mon, 23 Nov 2026 12:34:11 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:10 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:54 +0100
Subject: [PATCH 2/5] media: qcom: camss: Look up link frequency from the
 sub-device on the CSI-2 link
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-b4-ccs-imx376-v1-2-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=2505;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=SE9OTwNvO9+JP6HZCDsYQZuthYLCpe7RvJgDUw4zQ8k=;
 b=hp2zuUZq1Czsv84vJJBNUjKi1nRxNsBpPpdGFETpRZzJgomrKPLSiFPYImHQcAeT+XcHEeqRD
 dUfY47p4cu+CtXJ/2yK8asGvU6efWWj6ePDXG3u1MfbzlagG0IgUUpw
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

camss_find_sensor_pad() returns the pad of the first sub-device found
upstream of the CSIPHY that has the MEDIA_ENT_F_CAM_SENSOR function. This
is the pixel array for a sensor that consists of several sub-devices, such
as a MIPI CCS one, and the link frequency and the pixel rate are then
looked up from the controls of the pixel array.

The pixel array does not have a link frequency control, and the pixel rate
it has is the rate at which pixels are read out from the array, not the
one on the CSI-2 bus. The link frequency used for the CSIPHY clock and
the settle count and the pixel clock used for the VFE clock rate are then
derived from the wrong rate. On Sony IMX376 that is 800 MHz instead of
400 MHz at a 500 MHz link frequency, and the kernel warns:

  v4l2_get_link_freq_ctrl: Link frequency estimated using pixel rate:
  result might be inaccurate

The controls describing the CSI-2 bus (V4L2_CID_LINK_FREQ and the CSI-2
V4L2_CID_PIXEL_RATE) are those of the sub-device that transmits on the
bus, i.e. the one that CAMSS has bound. Return the pad of that sub-device
instead, as the other CSI-2 receiver drivers do.

For a sensor consisting of a single sub-device the result is the same.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..cf86bf04dfe7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4513,6 +4513,10 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
  * camss_find_sensor_pad - Find the media pad via which the sensor is linked
  * @entity: Media entity to start searching from
  *
+ * The sensor pad is the source pad of the sub-device bound to CAMSS, i.e. the
+ * one that transmits on the CSI-2 bus. For a sensor made of several sub-devices
+ * this is not necessarily the pad of the pixel array.
+ *
  * Return a pointer to sensor media pad or NULL if not found
  */
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
@@ -4530,7 +4534,7 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
 
 		entity = pad->entity;
 
-		if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
+		if (v4l2_get_subdev_hostdata(media_entity_to_v4l2_subdev(entity)))
 			return pad;
 	}
 }

-- 
2.56.1

