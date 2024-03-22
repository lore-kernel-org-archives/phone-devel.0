Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6C1CAA9
	for <phone-devel@vger.kernel.org>; Fri, 22 Mar 2024 08:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711094516; cv=none; b=BlxY8sBJYBpLGsMYx1CdqJYBFxJcbHdQI8hkF2MTAsmrS/CuFWgX8oY21QYZRk2a4FBMDsv7gvSdIzezwFqVW77TffaJfL+SQdP8HRbz33QGCM4fptJkEjYOHW3yKQSrkkdhrcZs0s3eCNm4u6j44uFnhdmIvi19Oy7yl7a744k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711094516; c=relaxed/simple;
	bh=eRAUypiy6NxphUecfUcmOhK6/zjL6KugszpYnn8ELYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anOp9ePcjsdzamJ8AxQl5hB5IKG/2GQ7qV0Ni/CT2jjg1o+8nLzXb7srAEw1sY39yOZOuNiI33sKt6+A73U7TLmW512AVFbLkZNAvHJzBBu175hhnNVIcamJ+6Xwi7uBNEzWveswza5RuTUmoMUDd2iOGcu9sw9uMhvdemutuNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1LUDboFm; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1LUDboFm"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso2018893a12.3
        for <phone-devel@vger.kernel.org>; Fri, 22 Mar 2024 01:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711094512; x=1711699312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pRYK0AY0UI9ndhzyuHsQHi/IsO1+vFhpELF3E3mlVU=;
        b=1LUDboFmd4Ic28Ky6iPYlJn0azhrckoKdyX2wp/ppC6JY1Ote+xGYlIKLgMOHsAGp0
         RSNpjl1GLtkpX2QIeTx5Ds6VHHTk+llHV6QFQOEFvIE4Yhg0ljJ6r7dCi4P7t7yjnyuo
         H7gzTn7acIg+/azmTkeyhAA0E+CM9f6/zh0B12lfY9bY5OsEFK6ViFQpSFx/dyxWsFRy
         2jHEMNzy9EI47DNJGTij8IkZxICIX/3wbjKp1z4W9RFsqNsbdvq7abWWOa7IDGta17yG
         nlW8gEo4gTwq6PLYrhilWe4QkR0vqHjgGJ+DVKsd0Opu0AFbcix+F/W48JXxL9RsC8tY
         XdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711094512; x=1711699312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pRYK0AY0UI9ndhzyuHsQHi/IsO1+vFhpELF3E3mlVU=;
        b=G9G1YDRkaj4WEb7KxY5XeuJpYWS969FdFl2rEgUS+gUifsfJzM4fDSR3SCYHT/SEwq
         QhwRdqnNgePLBSB1j85E5B/Sy0vugdRRFMTyKnXvcaOBldi2+WvIVoeIZb47mOxzZcZ6
         yCYTr8LsKHKhK5sHgRt30vLaWyTtRR6KLCFWmrnOd1wU0NjZY/BV9M7PVMLfGcCO1+6j
         zRvT9ZM9gim7aqtTA6In1ZuZ2J1jZimbt5iH4ndSPykMb3ukycP9+lnNW3feUPvuTCYy
         P/8tR2R+1AWc2snHclz8cAlqeEutjDpjYjeciFrAOleq3eQh8b4W4+CyhEstfUq8Vrcy
         mTSA==
X-Forwarded-Encrypted: i=1; AJvYcCWF2qNltuYRWwKAZOgdISs8QgUb0G7PjtlXIflZhsCW/Bw/CgIDIIVFgg9bV74cHJoWmGki3lQvv0o/y+dYVN245eeug9ZiSHBfbUg=
X-Gm-Message-State: AOJu0YygfHEFgsMTw6wvpifDpvooU75Td7df5/Bwu331O/PwH3GiUaaX
	kGekCtgvDwjNbTE2evsrNjFM88be5quRZG/0QhH/M6nT1bHQzx4dapfomD3cxjM=
X-Google-Smtp-Source: AGHT+IFMV+nhmCMGnciFCjJOMnCNNdWpE+6zHt7ZXFjZQ3ImU8IBSLs+ufVU4s1Y/2jvby1lqIfekw==
X-Received: by 2002:a50:a6d0:0:b0:56b:9162:8e6 with SMTP id f16-20020a50a6d0000000b0056b916208e6mr1069232edc.18.1711094512569;
        Fri, 22 Mar 2024 01:01:52 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (046125249120.public.t-mobile.at. [46.125.249.120])
        by smtp.gmail.com with ESMTPSA id p29-20020a056402501d00b00568c613570dsm739889eda.79.2024.03.22.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 01:01:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 22 Mar 2024 09:01:35 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: pm7250b: Add a TCPM description
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-fp4-tcpm-v1-4-c5644099d57b@fairphone.com>
References: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
In-Reply-To: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Type-C port management functionality lives inside of the PMIC block on
pm7250b.

The Type-C port management logic controls orientation detection,
vbus/vconn sense and to send/receive Type-C Power Domain messages.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 91a046b3529c..d9abac052afe 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -51,6 +51,45 @@ pm7250b_vbus: usb-vbus-regulator@1100 {
 			reg = <0x1100>;
 		};
 
+		pm7250b_typec: typec@1500 {
+			compatible = "qcom,pm7250b-typec", "qcom,pm8150b-typec";
+			reg = <0x1500>,
+			      <0x1700>;
+			interrupts = <PM7250B_SID 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
+				     <PM7250B_SID 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
+				     <PM7250B_SID 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
+				     <PM7250B_SID 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect",
+					  "sig-tx",
+					  "sig-rx",
+					  "msg-tx",
+					  "msg-rx",
+					  "msg-tx-failed",
+					  "msg-tx-discarded",
+					  "msg-rx-discarded",
+					  "fr-swap";
+			vdd-vbus-supply = <&pm7250b_vbus>;
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.44.0

