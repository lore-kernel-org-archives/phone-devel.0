Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581550;
	b=ENJuA/VdZcmQv7EhnU8+iBNKqrM1T7+XNws0nzTreEaPNe0qfWSOnLUJRa5mQ5ut5pOp
	 4hnJuIbydRGxiOUrKgtDHju8dw3ZbGnhfXL7ZFdKawI0GC9Ds7jP77yjEDBnoXaz5VCCu
	 tMyD271uwqHF/3JA6OZppy8bL35LmmKwEzu9qO5Yyv/ScSpTD6oq0rtE0U7Cs3UQpro5V
	 G/WIIit7yyCSN7ITYNtoH0+9TL3hyTK+rU78W95pSUTwsF5cj+nUEbcWGxfU8wXZYLLu9
	 dQYH+DtxrGHlX1IAPJm22Eo8d/dq20nAfogQan/DOv6QooVXMlQI6yQU/IABdGtQXTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
	b=vq7st04dYr4FDL4L7RtqvUR3qJztXesvZ4fppZHGEii2zlOZh+P5zBcS5gZAi7BUIPhG
	 XpTdbHWZhkCsbKDqk7htCdA8ojefNs7nGTAEKb6wgBw6oHdHdQReZQudid/zQRfMAOlWA
	 ujLfJHNpCIxuJ/YQsUIBT0HGFNWab1ukdMQO4CZiYkpxZ0eHrFRisXFZGYJk0uK+sweJm
	 pVnXHrgn4a9r5CrhW3OaY4W3ndSGULypSmCTEIV1C4LpB5Sr5gxPliRRx+b9+50ITUGnv
	 or3/WRbvNEqPoMrlRUe6MVpueuPyxSoOYwlo5FQik0zmQKFGZximFYZdxfYx4wQlH1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=aFiWn8oQ;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39CE606A331
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 14:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A39CE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=aFiWn8oQ
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so241388366b.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 06:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794581548; x=1795186348; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
        b=aFiWn8oQ/Gdg4T0XFGfb0riUMpESOKfoO+blWZhQoaQ3KXBLpAxYHhpASVfVWlv+eC
         hd5Xkd7VZxaaS34+U6oPmvp7dqvXD7S9GrX8nSgOCXXex+j1laODKF5G2z2+tjJAWGOc
         qAiaOWTXBxR+RiZ+STVemTty5R4xbYnIK613+GcMFWOTO3jj8zBx3R3FaIf529asBtYc
         ImLVfQ5UaMskbedLnsU9Qu9C6whXAOZGo7ji3n8sI3PLB4jq5aXvMhBrJdfvh+uU3Y84
         BPj6BYfSvF26pn2G5W0aZk51yHCVjqsU4upU/LCx7kRUaSn6MnJGVrBdWvyeCH03LQuL
         D13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581548; x=1795186348;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
        b=Rddhd7k2L1MnBT6LVZoYOsPfxmaUa4jqpoYnHKDBI3c8zjomcKdCoye9iX2coly48x
         ReNklQZR0iHV/58UGzMbxXnHuAdNdjjhQc+8jryNy4TV38JvEAZpZ9UHXn0G+7FtN1uO
         x6KUpAshrwVAgSNMtsRVcHJJV3ge3MGuxXLBuFC4XMZoVhvltOb9KJ0wuLmOM0qoHas5
         WBOlZvX5i4MD5DiLk7t0Tzl3ThorB3mPz9HAcviff7qdDBDRiyl4ZHTCBytYz2rH5tr8
         DW/xirKgzZtJhkCgjrz9T9A+QVjkZICJMLYksBS7RjFaqxImRMXFotLlwVRbccoHTN7J
         MREA==
X-Forwarded-Encrypted: i=1; AL+hErEekzaSreDEh/8XzZ1ZbTDLdBWaijGK5mg/03/WvyMvA3aij+6mLfe6qrCQpu2cKiSwSKpc5fJrhQVXvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z928X3fiWmlntETN75mcCz/aFnC5Y1qFi2KuvjJemRmDMLJqVNo
	u/IdcIR699nDX61n+RrwyYuGL1a+4bJJm2GHdQZrp0tmpO8i/YsPfODJiKQ8KTLsxqkXY47nuVy
	x6mNafps=
X-Gm-Gg: AYBFou2Naniv1I6VcldpdEcyLP2Rc3+qqhggLVbHVD/XwZZWOZ6x+E/DWB2KkxEgRUE
	utdDyFZ6UQY9OFykfVB7BaH6BDLe0XSKt1spVBnhY/bQc1w9eQej5D89ltWo+sMRs3DVgB4YOuc
	J5hC99xOXLMPAYJSCSAz/abtmpFQlw890XA9W0L2ADdwtxxbJHnu7tFi2Ntp22dlBMSEuhbuWpA
	SBe5Nwuu26UdWqgL8u7W+iqaE9Oyme6p9RONRvt2gGj012O4qPfUtF9yuAx2k3L0ECrxswwYiaf
	dwGdpcaDX/cIUCyw9XaaGBqOc4zjAQAQvtBGqetoEnQGwhwprfEUASthm4bxoE5B8TKHnusYPSa
	n3ls84B5ikbCnswcFJhR87dodF9hL0n6wjzDIG2SzQ0zTZFECHYOirMo3EkkMSjTc1exEeW4XLV
	ZTn9x4ElbOBD1K3F84BN3MhHeQLvtTaZ9vGpe9td/l8TsodF0g9BuLHig0kCi35Mqy9JK8VmLeM
	u8I9ZftsHIp8Lj1gQtgeec5cxxZ3KP02wpbU3Or2oeJycUya1OL0zpWSnRHR8iNz85Nu5UdhIU+
	JSsjpd/onWSuUUjJW5mD86C5UI3E0PPL82+V0wukBPayqwQWQxMM8MYnqFTDzctLlNbN8NUHFIz
	K1NaFoyg=
X-Received: by 2002:a17:906:f59f:b0:c3f:c856:fb7a with SMTP id a640c23a62f3a-c509610fe94mr243168766b.3.1794581547988;
        Fri, 13 Nov 2026 06:52:27 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40831sm112988566b.42.2026.11.13.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:27 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 15:52:23 +0100
Subject: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Enable Iris
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
Message-Id: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2kkYDBi5imHR1qmOCQU7xZAQ7
 m4Vli95/78VlJOwQmdWSPwRlTEWoJMB/7TxwSj3wlBXdUtEZwxTi5JE0YXmcrWhIm4Iij4lDrL
 8r279zjq7F/v82x9G4vdcGnnXwFll9OMwSO5M5CXj0SHot+0LWuOClZ0AAAA=
X-Change-ID: 20261113-fp6-iris-bf579af01e51
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794581547; l=900;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=eOYybVYmm/vaSHdcDuworLmH2a8ysNCRIzxyd+Wv6Bk=;
 b=Oakb4yTV8EJe4CaVf0hGwMlwSdxXutNjtX2IXg+EVnvMzeZGSXydLJ2z4lMzaqf3VkYczrgNv
 kEoaXwbIYsXB/26LegEkRQcsr03nJhNjnMVCkPp4psMIYflweIFUM0L
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the firmware-name and enable Iris so that hardware-accelerated
video decoding & encoding works.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 5c4581410a40..e46db1b794cc 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -768,6 +768,12 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/milos/fairphone/fp6/vpu20_2v.mbn";
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };

---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20261113-fp6-iris-bf579af01e51

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

