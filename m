Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FE23A783C
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907975; cv=none; b=V/FhZGSp5Uml1W1HjasXzdPjeH5RrEJ895CVMD89UMuMbWJw3uFiSuiHPYtMznmnJPzY4adS4IS8M8mktqna4YsR7ERu1xZbYfOYulkgxTxG1mkWfo43rI4q2qLjbgwhB1wfL7h7NTd5coFwApNYIr03EJdbYWVCuViIPWwrWhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907975; c=relaxed/simple;
	bh=8w/E078ryHouVBIkDM5VDxMyqIuPpnQJBxohdYMpZzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=geRolJvb47QyQke58m00adlNqX5+nSZqYo4M4NvjHzqzxvJmp5D+zFxGC83uU6v2fmqgrhjLk6oQnROFo9uuQVDTMvTke8BRnEMTKFNf1hZqzxklJWiSml5yLnvluTXLbM4lsj8EHjqyObi6lNMTuI/66c+iEjfUQqGrw41opB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yut/IJQF; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yut/IJQF"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-661d20c9787so1221876a12.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 01:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773907973; x=1774512773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN6KKsEF4bWiFrFM9ysSK8lwY6F3e56lREb03czgqC8=;
        b=yut/IJQFZ+BZ0WBfIbDWLFFrQY0lgzLIZK1YGrdVcKLKtpe6ePFJqBL0CsCMSbZmb6
         OP/xp0U0llVclFLJEI/X5qhiCG5zMPLbWuL4GHp9pzIcVzn27EjCUrwPvHIK3QYV2Se3
         3r+E6AuzwOw2OEkV8wA3nMb1XRUNCmD25/cFRJEYpfWVZFvgiyE4CHmZN4SvdXTQtfGd
         WzxMExn5S0bJREV1Xntq4I5tnPsGWsdGtJJq+A89BBmKmA9JIw+eUdsVOv0AgMmNDk8g
         VWLtMY4fUSvxBwdHMaH59Htn6/QKUIwQSg11Vr7WakuKPsR93fd/3kjx3Rovd4X07d4G
         MiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773907973; x=1774512773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iN6KKsEF4bWiFrFM9ysSK8lwY6F3e56lREb03czgqC8=;
        b=C3obpYVr/cnahNvOp5zmp7+X/rtnFNs8af57593e8OTbhCEs2ovZtVxxXKNqwJ9xZq
         ge9PMYrVOqwMGLnFyQ12qdPOnYdTr8QgMh0+9mdkDb30qkf8l/v8AdgTnJOKNq9kFZ23
         Pyq04tpi6XPIJpmxzzmbGqy5HcfpltasS6U3MZRFU7YMCRqPlLwSzQpn1Wzw0OVtw4Ai
         hfFk0MijXrmh7JtsiC6FvhEGcnva+XH58uV0EsQDYGEZgWlAdvwc+ZEoVRUXsVYGd+pu
         pGvH/4SDS+KzuKlgS7z8yIlI/QtgNEjjR4c1Lg3VI3alHkJEoFOALvee0S/EVEQ6RdkN
         jU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkG7i/LuxuAVkznrY9IGq4UrxJWTvwwPqU41DGdu/FSdyHMSr2wKGI3JDrGmgmUhnKHaPVF7RCqN9W8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5CJY+TFCST3BqoUyzmWuXFxy+T81eXRETDeBLvEOWvCcxMye0
	5UHxifMQN/C7wmTxSX89WHGKzD1n4TiLh7z454hmq7cjtsQlD1bQbKLO26bwoagKNWM=
X-Gm-Gg: ATEYQzwdlRwZwDkjXCj+IOaWZCq3aiMJQsAeC5PTlRCUvqJcTb3EtZFbJiXd75f7men
	fyAvXUOQNAD8vJrxkOaGPvSdStEs/sSFd44Ik9y3+oNSa687wrjTXEuwMBeWcpLQbNZIEDbTNVw
	pK74cXUpqPVmYRFOYtwgPD8TDDXhvW3ywSdY3qyLr9p9nX2u4shwDhiJ/dUY7UD4zWBn8o1h++R
	yAXJBfWvt+2prRb+VwGYBZ9Alr9yX3GPTCqjWGaqeZvdS5qa/fKp6cke1TRvBWcTtrA3ynKrKWF
	HaiGlsNW/VfHmcn6jJVSmnSc29d1preLtXERkFw4+Rm3a1REOu1GyK7UkfjyiYrN8OeCYNGA2wg
	1DGqEesjO17MX+O0jZWkFXQr5EPBaTxCFqMtHU8WyqDui+nw2m+GbYV93C1vpksIgmuarW5E0Kl
	Tk7A1nlrPPGp6n/AhJj0XKs+HXef3wsHP2IJ02vwelyM2b/G5S/h8BU3RUsjuc4ACKidsHQJwI7
	HD5kw==
X-Received: by 2002:a17:907:8dcd:b0:b93:81e7:8454 with SMTP id a640c23a62f3a-b97f4796647mr386603666b.6.1773907972738;
        Thu, 19 Mar 2026 01:12:52 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1751cfesm399884566b.63.2026.03.19.01.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:12:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 19 Mar 2026 09:12:49 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort
 pinctrl nodes by pins
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fp5-s5kjn1-v2-1-6840da94c574@fairphone.com>
References: <20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com>
In-Reply-To: <20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773907970; l=2875;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8w/E078ryHouVBIkDM5VDxMyqIuPpnQJBxohdYMpZzM=;
 b=zx0AqybwzmnqXtWE4oOwmWuhkEpVqB9I7kNLjZIurmcQZUnGgGVLfMnjI8XTfmo3TIq3GGgc0
 cSiF4YfUE9sCWbHfCjZB4gtqEIRNAOw8yNZo2k4hkzHLo9ouQWsGqga
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per DTS Coding Style, sort pinctrl subnodes by the "pins" property,
in preparation to add more pinctrl states.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 74 +++++++++++-----------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 455e5c9bb072..c9c24c36ba7e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1257,41 +1257,6 @@ &tlmm {
 	 */
 	gpio-reserved-ranges = <32 2>, <56 4>;
 
-	bluetooth_enable_default: bluetooth-enable-default-state {
-		pins = "gpio85";
-		function = "gpio";
-		output-low;
-		bias-disable;
-	};
-
-	disp_reset_n_active: disp-reset-n-active-state {
-		pins = "gpio44";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-disable;
-	};
-
-	disp_reset_n_suspend: disp-reset-n-suspend-state {
-		pins = "gpio44";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	hall_sensor_default: hall-sensor-default-state {
-		pins = "gpio155";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	mdp_vsync: mdp-vsync-state {
-		pins = "gpio80";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio25";
 		function = "gpio";
@@ -1345,9 +1310,17 @@ qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
 		bias-pull-up;
 	};
 
-	sw_ctrl_default: sw-ctrl-default-state {
-		pins = "gpio86";
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio44";
 		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <2>;
 		bias-pull-down;
 	};
 
@@ -1359,12 +1332,39 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		output-high;
 	};
 
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio80";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	aw86927_int_default: aw86927-int-default-state {
 		pins = "gpio101";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio155";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart5 {

-- 
2.53.0

