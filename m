Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEA524C092
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577990; cv=none; b=DObVGaOyvdTCe03/SfbxfzPAUwPxOKUuBcIk9ZxbSuwe3A0kMtqgycU0anNVY3FjaK/JSO6vYwV9htA5/K5UljSY/auaA9/WwvsewsfAjzny9xN7CINMNCFM5FoMMcunlTQ/0HA5oAKQg+lv/xsrDcZsxwssIMLW71HWxrREftc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577990; c=relaxed/simple;
	bh=tRnf5jBEiJl4LnUMeDj/v6ykbwda/Bk2ASIHy1COQP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQkdTXuuv9Xj8W7yMMcv4SKmmfr2rKRke7SX8SnyEgrEnqU3wdeYXTNbDl9mHjhH8yv7JFcJBtdU1Du71HVMdL16XDj9MXbaP+T9O+9QmNmftP77528pOI6Bu+X9QakrrfGFllw2gQGh3/PjUBZFeyCupMRYcH9m6kVkWpcpuio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jv+N3IQr; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jv+N3IQr"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso3992344a12.0
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577986; x=1746182786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMFBVlYiWUTNesnBmbRprdbKrCKp8vKIq+iqUiZnf0A=;
        b=jv+N3IQrEmvWQTLKVa3bHPFripzudOt60WmhY0rKdDeEsAqebVA3lHJyHzI3loVuV+
         bne1C7uiwPN1dMUK2g0lMewMpADXQHODNS6s6rFM5s1AcmE1F6u4mbqni18gm9JPeeo5
         97klqkFIBrI5RN3oi1qgGsTOCeHlZ8jrsF8G1WATmsa/27C3iALZtqxrc/okScgLo6d5
         U1ojgEe0j0PNz9s0yY+jn1I9PDUZX1WxlCnuBkikeFqacXRoMep3zCQlr6Rzc9t1+WOS
         quyAzhPyj8rHPwUAq+hFbpBTlHEs/ErQlvg4ILUnTCsacBIDDAIarlo0Jfm0fqivLGxd
         Eqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577986; x=1746182786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMFBVlYiWUTNesnBmbRprdbKrCKp8vKIq+iqUiZnf0A=;
        b=hjWSnr1BJqoZ36UaNN823V/WcQRJoT1QJq+4/57o6Pw9M25YIPkZT7ZIsm5f1uBi5J
         7Gn07UvDgPv5qqc+NT2QF80iiYK0WUl/Z8PnskE1r0LsdCPesd9RnSw9+pmlrPomu8E1
         p5uBrucysJQx05uvjv58xhVhD2CCT0msUvC6aqmRqjmrKKBelD67x17G+GL6ke/0sVxP
         vdEBcVTF6TpFCy0WlyHZJFzFiW40jL7WsZByu1fBuS0L8WVRF5abjQ+R6sPYJp05Eem3
         QsiW/5DOjPIUERNObXkd3pfObeEw1dFDA/Kn/uzcbgjjcQ2ohWUlD63xfT3+zJS4LBl+
         qXPA==
X-Forwarded-Encrypted: i=1; AJvYcCV1xC2yj/w7Ai1eG7e1ERnl+b8zcLPBKVhLOxDFu6jCE7EO6FjCWY8bhZZPFRYa622xXfrK7IP+Nftkww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkT7M0Q8joF65ZDd/y7ujGe5+jwxhoQFl2masqpxwtox+sEnKv
	49OBfuPB+NSnIMkkSh8gv/41gqM29RQXEiat84BWEx4dMplPpFvMaIaZWPBEsVM=
X-Gm-Gg: ASbGncseDeiTtAP5Kw5QSWvxB3ae1HbZY+Yso8MCxkAGzsYNqf6893F6XE8Lgfbvyfc
	ZEP3dcLBE3ylrao0is4qY1TrilhNQbOXcTKj3MR+rZoyiUCRTr723ko5tfvwiwQvHzCmpvknUrn
	lag2Hva32imDod9QKe/g9RSW3fGgTtuySEE6ajvBjWLyOORwoPfTXLzNeB5JrqnP2hRhEUpODlI
	fSDmHa4goU4SmZPTLhT1qm0sWmcSwPItutIOWMMRPLvnm6sVBEHg0bbC5Lq54gPFeQDn5uQGNvq
	HE6SmIIoRUVNQH94AgpCVFCBgavOT5mSIg/16jNOPmXYexusqsodfBERbLRuXlLSdjTi2nMiwqh
	97kS31/garlk0jvXZ5TH8fuU2h0uYMG3v95QzU6CnAjlRicTLn4aQb8NZ
X-Google-Smtp-Source: AGHT+IEdyyhmN8yHbmUUfEn0+9+wTRJYPsL8v0Q96fwlPjQrvbsOdHjWTG8SPmdZ+dq9uVo5TLUNOg==
X-Received: by 2002:a17:906:c147:b0:ac3:45b5:d325 with SMTP id a640c23a62f3a-ace713cfba3mr163841966b.52.1745577986483;
        Fri, 25 Apr 2025 03:46:26 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:55 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: sm6350: Add q6usbdai node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-5-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a node for q6usb which handles USB audio offloading, allowing to
play audio via a USB-C headset with lower power consumption and enabling
some other features.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 375f964e793626115609996aa25ea4e0fefe6c5e..9a1b9f02282a0cf2e39bf2ade21989dbf4362bc1 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1351,6 +1351,13 @@ q6afecc: clock-controller {
 							compatible = "qcom,q6afe-clocks";
 							#clock-cells = <2>;
 						};
+
+						q6usbdai: usbd {
+							compatible = "qcom,q6usb";
+							iommus = <&apps_smmu 0x100f 0x0>;
+							#sound-dai-cells = <1>;
+							qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+						};
 					};
 
 					q6asm: service@7 {
@@ -1988,6 +1995,7 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis-u2-entry-quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+				usb-soc-be = <&q6usbdai>;
 				usb-role-switch;
 
 				ports {

-- 
2.49.0

