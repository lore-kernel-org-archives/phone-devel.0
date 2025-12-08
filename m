Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9232E11DD
	for <phone-devel@vger.kernel.org>; Mon,  8 Dec 2025 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765205970; cv=none; b=iYBQpULuO5UrZjxcvCC6jmA9sEttYVNk2rFUwD9FUWZ5s2YWeMyKTvgOp18qWN160ewvUSLdKp4A5V0HyvUCBKkO3EEPZgMGWyf/2E8GxaV3NeuRtp6Oe/pqVvx/bx9qgsQCJVg9dEK2GyRDeX6COvlb54azlywKD0RySNqGIRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765205970; c=relaxed/simple;
	bh=eUZx25U3sbk45BVbe4VOiqc8SJBQO3VlDhtP4glEGfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKu/yMg6fzeGzzd3Nwxr77nP7/+Usfbw3i51mA/RvP4Rs66CL+eAXAgXLXz4ZjHaNUMsqeHWJwXGx4odEz6eTv3KymI7ECzzg1UvqSVfEDO2ze34uQ1A/nQl1V1hOJxYqv+GvGD6BLSDauJHY2QrZfR/djqdFOfnWrvTFG0F2BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMMWnXT3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMMWnXT3"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso7390751a12.2
        for <phone-devel@vger.kernel.org>; Mon, 08 Dec 2025 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765205967; x=1765810767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvxbaU3LPveODQZxfbJsnXKFPnTK+dy5k6La/Lv5giw=;
        b=NMMWnXT38tD72xTyERVdOVSnkQumd/N9VuEU+8Ody51+i/cQQ76UpHWQiIHthIydak
         4UUj7F8bioWaGJLlPIuP+kjbqJuMdbYJgkDAZgRwnQzTgzPdgGqZEiD+W2ApRSzaapbo
         APAL5pENPv8T8RqooZA5iSE9mxsPZE04XMkidjo/T8cJB/YXjWPkD1M88/5l0WV14q+y
         MTQRLIZY3FoffisZXIPSUck7P4iy41FOCebZTwrDXk6OMOSzOKkJy1r10uhuwozt+CRP
         1Fz7RUtyQXxpV5Fiff3slMD/Q0lwkg0KudAYCfx6VIZF0RCh0viJaZprj9myImfoUvDr
         xLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205967; x=1765810767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OvxbaU3LPveODQZxfbJsnXKFPnTK+dy5k6La/Lv5giw=;
        b=BGEJEjjyLLOCD0gJ82eaWtDyPVvmqTDHQz4FeoCL/0z8UZRNTxiR6T2znmgqnodVhZ
         zRoG4Qs9Wc6mrgnH0dlc+iPbqmHbkRyXFoZHns5dAygS1yBku4/jV8bWtX9vz4B7gh0n
         NQFC4wz0Mo8WAtbhyDLEBPqa91jOWoQ+y/UzjpgrQaT7JH+k0pR26fiG/18nwXuMcvct
         XCYmgmTHtkKttSOj/9RXGHbyxAvRbWU0DSVFww0N2wSSMJw9ATOWKvEKh8bdo/ALOcaM
         ubs9NmwN3BiHSSmQWbBBrUKbklD+LqugZQR4MuTIY1Ri33CBiIeoY1YzjL8k/YlIR42v
         jGuA==
X-Forwarded-Encrypted: i=1; AJvYcCX4evFmjNNomWPZHZWcL4XGrxLm9QX3pfRLchl/GfUyDZt3+rmPOw31Eltg83lZwC7BtbvXXEFN8WAMMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ9j/CnSl8AytPDzSZRjhvvvMBlWt+hV05sgxbb6dQvXl98AcY
	JOE8VVqCttinfTQvEhlv5vKkEg1z+DUICx10JhSY4lvK09HctVov7R79
X-Gm-Gg: ASbGncvcPGlddGFSO11j49AdpizE5C/nn/GiFbVRUtergdvXZdUI+0UeaMf8oh4ryDk
	U3VLTxo5Xl0P9Vl8M/n+HlTsVYYDJZ5y1LJh2X7y8jJHfyA9XMedRRCx4cF7d7BA7/vCBuSw7bt
	ifTR/nzX1y9exDbR8aZoYoCeClv9Jkac/5V5WtXkHFx01TGclDtp/XYoT9alrW4yaQRiqR2WqeT
	hMQVKYdvGxMOyyxRNR1VTVLRRHhP2BUEp/c4DYv5mgvz3TN0evGxlea/QLGVX9wIKopzr0uCYIY
	16T0SIhh39Sqn6xLfmLFaDfWv08rAm7hh19QvFrdvZO5nlorBVsQyCHVsNWUVAoxMu+KAonPBhA
	GL4jXoxvyHTny7siqFIe+HP4izRvZ0JBjvEgwff+hzKx5Sth0kkOYEz7Di45c6qWldUQIXnQvph
	EFB36/ztaCUtIGFw==
X-Google-Smtp-Source: AGHT+IHV4wT+FTlujDS+GtkBd7fAewGRJD2xd03tll2P5cqDlF7fKs1POKod7qkfkABTKmYBFPloXA==
X-Received: by 2002:a17:907:6eaa:b0:b73:9fea:331c with SMTP id a640c23a62f3a-b7a247eb824mr788301366b.47.1765205966796;
        Mon, 08 Dec 2025 06:59:26 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec300esm11365556a12.1.2025.12.08.06.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:59:26 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 08 Dec 2025 16:59:20 +0200
Subject: [PATCH v3 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-b4-battery-hall-v3-1-84e2157705a4@gmail.com>
References: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
In-Reply-To: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This device tracks remaining battery capacity percentage using voltage
mode BMS. This commit enables the pm8916_bms node and adds a battery
node to track its capacity. Battery properties were taken from the
information printed on the battery itself and downstream device tree
for a battery named "nvt+atl_3000mah" [1]

[1] https://github.com/Asus-MSM8916/android_kernel_asus_msm8916/blob/10.x/arch/arm/boot/dts/qcom/ASUS_ZE550KL_1936167_3000mAh_3p4COV_VBMS_Final.dtsi

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 61 ++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index ebb548e62e02..d0f0f80dd326 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -20,6 +20,61 @@ aliases {
 		serial0 = &blsp_uart2;
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion-polymer";
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4400000>;
+		energy-full-design-microwatt-hours = <11500000>;
+		charge-full-design-microamp-hours = <3000000>;
+
+		ocv-capacity-celsius = <(-20) 0 25 40 60>;
+		ocv-capacity-table-0 = <4378000 100>, <4220000 95>, <4125000 90>,
+			<4071000 85>, <3977000 80>, <3916000 75>, <3866000 70>,
+			<3838000 65>, <3822000 60>, <3809000 55>, <3797000 50>,
+			<3784000 45>, <3771000 40>, <3757000 35>, <3743000 30>,
+			<3726000 25>, <3707000 20>, <3688000 16>, <3670000 13>,
+			<3655000 11>, <3648000 10>, <3636000 9>, <3624000 8>,
+			<3612000 7>, <3592000 6>, <3569000 5>, <3540000 4>,
+			<3494000 3>, <3418000 2>, <3289000 1>, <3000000 0>;
+
+		ocv-capacity-table-1 = <4378000 100>, <4292000 95>, <4226000 90>,
+			<4166000 85>, <4109000 80>, <4064000 75>, <3992000 70>,
+			<3942000 65>, <3898000 60>, <3859000 55>, <3826000 50>,
+			<3802000 45>, <3788000 40>, <3779000 35>, <3768000 30>,
+			<3752000 25>, <3732000 20>, <3712000 16>, <3696000 13>,
+			<3688000 11>, <3684000 10>, <3680000 9>, <3675000 8>,
+			<3669000 7>, <3658000 6>, <3636000 5>, <3599000 4>,
+			<3544000 3>, <3466000 2>, <3341000 1>, <3000000 0>;
+
+		ocv-capacity-table-2 = <4372000 100>, <4306000 95>, <4247000 90>,
+			<4190000 85>, <4134000 80>, <4081000 75>, <4030000 70>,
+			<3984000 65>, <3930000 60>, <3884000 55>, <3850000 50>,
+			<3826000 45>, <3804000 40>, <3786000 35>, <3770000 30>,
+			<3753000 25>, <3734000 20>, <3712000 16>, <3693000 13>,
+			<3686000 11>, <3684000 10>, <3682000 9>, <3680000 8>,
+			<3676000 7>, <3668000 6>, <3643000 5>, <3600000 4>,
+			<3542000 3>, <3462000 2>, <3340000 1>, <3000000 0>;
+
+		ocv-capacity-table-3 = <4365000 100>, <4304000 95>, <4246000 90>,
+			<4189000 85>, <4133000 80>, <4080000 75>, <4030000 70>,
+			<3985000 65>, <3933000 60>, <3886000 55>, <3852000 50>,
+			<3827000 45>, <3806000 40>, <3789000 35>, <3769000 30>,
+			<3746000 25>, <3726000 20>, <3706000 16>, <3688000 13>,
+			<3681000 11>, <3678000 10>, <3676000 9>, <3676000 8>,
+			<3672000 7>, <3660000 6>, <3634000 5>, <3588000 4>,
+			<3528000 3>, <3448000 2>, <3322000 1>, <3000000 0>;
+
+		ocv-capacity-table-4 = <4358000 100>, <4298000 95>, <4240000 90>,
+			<4183000 85>, <4128000 80>, <4076000 75>, <4027000 70>,
+			<3983000 65>, <3935000 60>, <3887000 55>, <3852000 50>,
+			<3827000 45>, <3806000 40>, <3789000 35>, <3764000 30>,
+			<3738000 25>, <3715000 20>, <3695000 16>, <3677000 13>,
+			<3672000 11>, <3669000 10>, <3667000 9>, <3666000 8>,
+			<3662000 7>, <3652000 6>, <3622000 5>, <3577000 4>,
+			<3518000 3>, <3440000 2>, <3321000 1>, <3000000 0>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -135,6 +190,12 @@ &mpss_mem {
 	reg = <0x0 0x86800000 0x0 0x5500000>;
 };
 
+&pm8916_bms {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
 &pm8916_codec {
 	qcom,micbias-lvl = <2800>;
 	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;

-- 
2.52.0

