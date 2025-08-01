Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6A8266B67
	for <phone-devel@vger.kernel.org>; Fri,  1 Aug 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056283; cv=none; b=JRpbqw03xucccp7Gw5Wr1SfTNrWtOH69XJTpsAoqHz2KlvUKerKynQGk591X+pfFpDoCeRtXfBtPScLcO3VWQdyqZ/qTsauo7k8FP4JwlzwS9KNZPKNMyF4733UbEGlPh3wHhcy5EWZD0KFJu6z737lBMVTascf/Ftrvb8/DvKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056283; c=relaxed/simple;
	bh=5wYZLPrjAgyvLrT/2EjpWd4qfw44TDTvqfBJ6GFqBfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFHAXAoFM/BmjNLuJm9nieh++yye5uTs3JQKpJwj7AhnPhIgoeBubWxMfsRtap9CDTJdh7SZWG+CVav6LzB06dn9lo+pSM7U/H637e63p9ZvWC7gIfXclREUyb1KvvZ/D7IPFig0gTRDlMjisUb+9enxZQfzIh8Lpo/jZVgveSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zWurBwwy; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zWurBwwy"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6153a19dddfso2552538a12.1
        for <phone-devel@vger.kernel.org>; Fri, 01 Aug 2025 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754056279; x=1754661079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRA5IQz3Kxl9BVoXiCV4QgbhBt0GVpIwT3gqGgrohiw=;
        b=zWurBwwyHdm/bTlpo1VmxJzCrBh7LSx/NvV0v6blxKBDcGVT57G9RBkwJcJuPI973i
         6VJwR4OYYZsKaduPHanBvxsYVOSheW9+LHvoXDQ1J6VC+vdCdMmmIMSslxLLuPnkcfF1
         MFuPMiTxC7+x1JsByKSWD/4fqqF7bzWgMEsFJ8L187ih0iV5vHxwJCKjpF6MnB9GjhlC
         wkwl7QP3h71loVYUdKFP/aweGH1YFEm3pa3PV/lN9pZsf5lDIkMglFDAks/10MgIpXm0
         inDdKKLML2sUMXVgy8pyzLAlzXnm4RPttDeI1oiF9vPZierR9SwEsX742sNoEhJsksUN
         Zsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056279; x=1754661079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRA5IQz3Kxl9BVoXiCV4QgbhBt0GVpIwT3gqGgrohiw=;
        b=OWx4/5WYflaMsUYi/s92poa5gO9qEHChuUYscjiHmJpazFkvyxKZIuZFdtPNgjpuPZ
         FeQin/Rp/uEwd6Cn60eN5vx6UocBwxbub66GSGP+SyU9BOXD8IBiuybSMoxC9DYb6XxI
         VahrTkP2emNrEzFXQlxpnNIxOHBTD8//AaSDL0jjryX87+c7DOT6sTiN5N4bExiK1r2w
         94LlAx9lxM6KSzYPdXDGFT1MzDvFQbnnFD17DjL4ml+p4xNQQ+Fu6k8Nb1JWGKiywIq3
         Vqgtss3b8ANXgJ3TEzzL29qdNx39Nkj8i4OfJgOdlnC+G+JylGmQYdlEiNNJbk5Q3OVX
         M1Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ12ocv0L7KroG0u7AT+1RCeM6R/9DoKkNy9HDdQHsGqot8gwjhXKt8KIysju6PstX2aG8twGjyaie/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDDhjbP5f1g4DgVja/t01ofBJx95YvaWcgJDALFzztp1rtQKPb
	NfTEdqC4687PlDTumPEPb5qKyfkuQbVtXtSKpq7mGrCpyArGUopTbNvIPTUPFZ0rumk=
X-Gm-Gg: ASbGncsXw3gJu9NaXzuI3VprKGF7D1GCwluY+mLeiO2bPxScd7EyyYlsq+9+AeFGdMZ
	deRT8tlaaQ1b20jivZJ0b9Q1xM5N0hs8A1LJabG0K93BeGDL0yZQpLbKQ/1j39NJUHi9J2qUrHk
	DaDbE+bQFQzSWegVAftTtCGyJZb7yUVggFGJWG+ep16Oil+AYZHwv0Z6HLo/dZUkP6/hqH2Z5Bt
	G2arLVU4nQx86iHN+YMie2rvpx9gBlvNGbxIdjSZXYUXRf5nf6zDcprLZcjVqgb5bOJVDVrStEc
	uO0pLJ506yEO4H1s5eC/1X/xx9piYTrIOMdaqROR70utbv6LsQzneDsRtIrNDOIH74kPCPUB5Sl
	aPMrC8qiCW4WCToZeBanrsgRET/nYYVjp6vYFP5xsHzJttUOQESh1SRs1P3fqMD6zIbyJ
X-Google-Smtp-Source: AGHT+IG/NhFjdelh+0q5nIHa+0bLUeoecZlUq2UNEZ57VCYPAqMbnzkMpVQaT95gwgE6ewaOotJlxQ==
X-Received: by 2002:a17:907:72c9:b0:af6:a10a:d795 with SMTP id a640c23a62f3a-af93194b7fbmr371594866b.55.1754056277620;
        Fri, 01 Aug 2025 06:51:17 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92a2ec9cbsm180542266b.79.2025.08.01.06.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 Aug 2025 15:51:06 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable USB
 audio offload support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-fp5-usb-audio-offload-v1-2-240fc213d3d3@fairphone.com>
References: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
In-Reply-To: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754056275; l=1288;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5wYZLPrjAgyvLrT/2EjpWd4qfw44TDTvqfBJ6GFqBfA=;
 b=4nUFJKVqMX7jxia0FxvzjfDDiNCpGQYmclq2OpXFGK5swDfbtHsiVXXgOtMJnLv44VVMRM0le
 jpdj5BSF0vqBVjYI8Gug3yIHfIORYs0v6d0+zrkb7cvhu/rgITzSPJP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable USB audio offloading which allows to play audio via a USB-C
headset with lower power consumption and enabling some other features.

This can be used like the following:

  $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
  $ aplay --device=plughw:0,0 test.wav

Compared to regular playback to the USB sound card no xhci-hcd
interrupts appear during playback, instead the ADSP will be handling the
USB transfers.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e115b6a52b299ef663ccfb614785f8f89091f39d..d30912f952db271aa4fbc2570ca04b771ffef3ca 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1176,6 +1176,22 @@ platform {
 			sound-dai = <&q6routing>;
 		};
 	};
+
+	usb-dai-link {
+		link-name = "USB Playback";
+
+		codec {
+			sound-dai = <&q6usbdai USB_RX>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai USB_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
 };
 
 &spi13 {

-- 
2.50.1

