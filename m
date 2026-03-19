Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A73A9D9B
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908614; cv=none; b=u4wozFa/SNOuKJQTRaqIGKp50EuzXYdeil59iXAyyBVmseF1Inc+mInLZXBsIkGwsYAORKJ5zdErGts4Pu4dN7pN1u63axEwnoqi3dx6RVWn01q+5RwdohYCesBtNaQTC9bVQf97M7e2IG2xQbWSRmybeQTlxyKFn1lSEG9uL+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908614; c=relaxed/simple;
	bh=fdpk4MTgCCFUAQt8nrxbOj/3thQKl+8AmAg215rAl9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JjLNXwXSTuHPsCc63AvsMZfBsfDOpxGj5gU2sj0gso/mu2/9c0HVMSiGD016PEsknvUbYPqskwgTQyseIsj4R0+Ny2wyGE+v8/cu6jBu9JQDWzDRBZUlKRPS2AZWo8Y8Ctlk7DldWg+Nq/XalBDC3ieNc/ouqKLWVJey2oqJS/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3yqK2n+5; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3yqK2n+5"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b936331786dso39295566b.3
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773908612; x=1774513412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XRA9gX/8dteqw2ACYowOiwX4yv6N0Hjd2tp0wHZbVY=;
        b=3yqK2n+5GgRRTfO9fW20WsuTaPeRkXJrvevTdIkIVX+R/ZY4XSSqXWm6xn1TRJCuvG
         R4s9QgiNlMJIB0AksIp7dRCRH8YXCqNn/5bQwZLTGxUb0r5IjRL2y2RDRPQu5Ln5ujwb
         X90ffgOK2TCK+ua0wehpzI9xAAipewW5udZs+PjSpLPlIFMccwmAinV2y5etgZfWCdDk
         R3lHyU5dtzbVhOHJopqu2XOiP8ygvrcjFSHeupwmYgWvO+BJ9XhQHLCcJgfAIoF5J0ZB
         TjXtC1uvD8IJNjneRt1iRYCAXs2pcdCTefafFgqql54o1pxMIGOrGvLhwszfJRI33qxu
         I3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773908612; x=1774513412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5XRA9gX/8dteqw2ACYowOiwX4yv6N0Hjd2tp0wHZbVY=;
        b=WDYB9O4qxwjj9Z0ZfKKoWa3dWsy2gdgZeURrTyUN+H5a/EbtkZS4L6vtFDyYrhCdBb
         eIVeo1IPzgy2W005wJm4Vc28kh9TR6XpBni8IbQGgCst2XpqDLrrmPFhsUBeA/lcL3Mv
         ogGUfuHHamAyeG4WlW5cmQvERem4DZ8dKtmjUQYudk84MWn5/nwush11T6CKneD9Wadj
         L/YoUduKNJBj4bZXhPkIECcCFZh2uYVRcwWiMbZYH+WSyVbcC0vTfIF7nUWhpTSra3ue
         05q+FEIcnyJsQrrJyPkpkf0TM10B83WHraIKs5NA9NDVvaq4JVwBxYuy0HuoPC9+81zx
         Qv6A==
X-Forwarded-Encrypted: i=1; AJvYcCWVimURtnhYdC6edu8RGuCgJ6QeOpBHf09Eg6Jv5E0o3PNZxqvhxd3EZdWxYikv30dXgM81Q9MFAEW8CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG+WjMe1LAXYj7iVZGas210o7+zumD4K80H1C2gux2fzJIBc15
	tPQq6/+7BtxmRVxNoBEm9VYBfrN/mY9DvdH+tQ21FeXcd1yS0pEAUqAmaDJZXm53O2I=
X-Gm-Gg: ATEYQzxLSDSpw+nkS59ovPxm9l4Hb6scsX+Q2xwDxdY9VmT52lCYY2MwwJjnOfz0jGi
	KJLqlxWNUhWdLmANUSNM6IsVIeU60JFr2wF2DH0e9xkBRw6wdqi95e8fTCeZgb0Ml9FHA6RnsUg
	K38zYVrs2arYyGivjRj5yzthsYwmysgvek/mMAB/1WJrI4TuMDQcjAfYmghTcCgYayVdtHz192H
	QoMEIRXocNx9RCU0qnSN9V/tc5vydtk8P8DO2vZo6kUxhtqShKg11K5fmYC+IxSxhMBJk1GGZHb
	0/v/s4eANaYIHic3i1YYVknzj0O3CIYhiu1+zHGMHe0TyUfVgLXpy0ZKmxO2scbAHSx2n2ZEXO0
	vwuhOMisP6grZEm5XonRPOhbUXMBr1NhyFpHW8qIP0uu59YAj/ERQ0RlBaoderYBxZEw1tEZaum
	1BBgZvSRSUzTGr8YG3rKmhgToyOukTpqGUxMUNvcHH/9i+eJSRhZ9hhXnrNjx/nW/L7RRCR94qw
	G1Y9w==
X-Received: by 2002:a17:906:c145:b0:b96:e593:fd1e with SMTP id a640c23a62f3a-b97f43498bbmr434848766b.0.1773908611741;
        Thu, 19 Mar 2026 01:23:31 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142cf16sm419743066b.20.2026.03.19.01.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:23:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 19 Mar 2026 09:23:19 +0100
Subject: [PATCH v3 2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-milos-ufs-v3-2-b7c60bdd0d48@fairphone.com>
References: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
In-Reply-To: <20260319-milos-ufs-v3-0-b7c60bdd0d48@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773908609; l=1152;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=fdpk4MTgCCFUAQt8nrxbOj/3thQKl+8AmAg215rAl9M=;
 b=8Zae//PUHJFF0FJtN23rMqKFnv3U5ZwaZiUdM+BkjrJK2hnabwXyI5noSUczI2b69uNN7bqca
 MKm9nmD8uA5BB38IO32+LqT95OnEDWrcBySaVQLBzCSJq1u/Dunp1V7
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure and enable the nodes for UFS, so that we can access the
internal storage.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 89ba09f48491..bba327cc7a38 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -838,6 +838,24 @@ &uart5 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 167 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l12b>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l5f>;
+	vccq-max-microamp = <750000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l2b>;
+	vdda-pll-supply = <&vreg_l4b>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	dr_mode = "otg";
 

-- 
2.53.0

