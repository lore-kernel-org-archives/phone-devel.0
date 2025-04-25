Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A73B2356BE
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568461; cv=none; b=bRtVYCZe7wmwRcUz4uT4Zb9g44+uGkqeUX13s4F8xWoGzMEx8oui7VIu90v6UPDelnC4a48YuZzhewUVCqeZ0A7uV5KP8SrW14JRfO9ad/yyq71M8e6O5Dv6RnXuwIpUINT8u6gSZqBrc6+WPVOBnCrhN5fn07hfGU7/F7z9hlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568461; c=relaxed/simple;
	bh=9du/cqVmLABi3S4H7ZzYui0a7J0RxPnHiR8v0eg+GN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXNE8q7NUT9YB15mf2ZA2j1R+fUy/PAUUEMOxJoJEINkJl77Ulgiqa3DM3ZclJdc/Fe5mKDOlG7pCNZ6bzO6OhYdZ53lSS/kTplK1CuZ6bFUpaIYv6JdyQ1EZGk+1Bck5qiaEDqJ38DeiOWSL4+mXc5WVULuN7YRQYYH2QsaGqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=06u9WB11; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="06u9WB11"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so22619295e9.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568458; x=1746173258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WF9R1PkrWxK/cwLXU/35vaxB2tRI8rlJl2KnNgRvug=;
        b=06u9WB11yeFjOEXvumQCtZa/Y7L34FubxjwlIs7sJ9qQA7jRuQGjcwFNqy3IWih0j6
         NyFjgg7M6LhuhZyxB65WpfGFYwjFVg8iYv7lbyfImyn/NUjiob2KXrnRiceo7s5YOlDP
         YuW38CSglFy/P5j0C8r71cmN+cquvJ/t/jDXWnnZC9QhxlyHkURT6knOhC6Zr43Z8MXk
         i231yFBWlfikmtuWGbtPb6YknEdWO3rmTZZHjM88WHmc5RH+xOJwE5whZXvkkMjah27V
         JQIdSN2NTI8oxLvOpNt2Jot1IdoPfNBbuSOhxfhD+zfNRUq/dRn1VbvPTLfmV4xYu1nh
         qpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568458; x=1746173258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WF9R1PkrWxK/cwLXU/35vaxB2tRI8rlJl2KnNgRvug=;
        b=rCrGrGDkoPNiFp4djH1NUD0eWhq213b3nnTcgvAwhQM/VqQM95K5+854fEmP5O3fVU
         3BrUD0nUGNaNBMrWqzN3EGB+w1w+npcZl3Y2HYdJLJ6za4Cu5IbXLSzVNqXTAmclTxi1
         p5wTaUR3Xdl4LJJfNE/9HDKSQxQurszjX3LLIZ8E80XP2AIUX/nqy/wTUGLONiEi4WPr
         Etb0g+zKxKWzblF4nbogv/KkRFNyFzbLuGzi5i3H7l/e8BTVzjqjyjvSWEr3vOt1Q1cP
         t5kGgMVjy3QTZlJSci6S8UBDafp5dMe0IiUzwU9lUInsW9Lm2G0csNbjHjHMNLP2W/LV
         Xc+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV48LKZE009gFTrXskPc9bvAaGWSizj1DbIE2ZNkTzzVaZIeqYhsphg8PnaIJ3EdclKUgbObC2rtbuI9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfMZEuKVlX7HIyxJAbWlmrIrAPqRhKtw9nLPzUsIK+EJ8WrmTo
	sXTG7BX4dAy6ZcgL8+dsSA4oGPIxu7FWCCbp9bKSJlYyZHAP2sazSdvNObWV+IM=
X-Gm-Gg: ASbGnctgbcayDqgCRqEwqrwoY5xmZiFzh5ThnlxRgqhwYW3Raf0FYYcsr2yS4R9Y6Ov
	Pos/XnMBZNA1ltB1j7Y3M7Ff5yF7q7B0Yl6ZCFYNTrcut4Nc19mIevWxNPirxvutypxQchYvhNM
	+R26fcQkPNkjKU5Ey08qOxAcQr7veqqWxWYvLyLP747mUkpiepOXvkkSN0EU7vDOqgtzIkXY4Ag
	9EX9AZkU6kPEVVLh1/cfp32AssRLZIS++1+QscLQ6S2RzPR9GVwku0fVDIC2+76QIU5WqJMv1FE
	t3CfC0LAxrhy4H/wws4CnqA1n03Fw0uxFxFDNzK2elKWbYReuorNzcJtu0389N42Z9VRvNociPh
	f8EjjcmTqFPonUA3LuzmfsMyyBd0obTY9FcG3T7By+HWRgefhIv2OiynZ
X-Google-Smtp-Source: AGHT+IG/sz31Wny+TtyIaDzEEdUt0YMeO0mUdD924acJQ9OoByTsHsI0o1wsRu2TPR3UpEE0kePClQ==
X-Received: by 2002:a05:600c:58d7:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-4409c52a44dmr43791425e9.16.1745568457579;
        Fri, 25 Apr 2025 01:07:37 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:29 +0200
Subject: [PATCH v3 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-5-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add the required nodes for sound playback via a connected external
display (DisplayPort over USB-C).

In user space just the following route needs to be set (e.g. using
ALSA UCM):

  amixer -c0 cset name='DISPLAY_PORT_RX Audio Mixer MultiMedia1' 1

Afterwards one can play audio on the MultiMedia1 sound device, e.g.:

  aplay -D plughw:0,0 test.wav

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 9e8f9fb57c4723a24704a8239a86c6081910916b..e115b6a52b299ef663ccfb614785f8f89091f39d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -14,6 +14,8 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sc7280.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
@@ -1147,6 +1149,35 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "fairphone,fp5-sndcard";
+	model = "Fairphone 5";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	displayport-rx-dai-link {
+		link-name = "DisplayPort Playback";
+
+		codec {
+			sound-dai = <&mdss_dp>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai DISPLAY_PORT_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
 &spi13 {
 	status = "okay";
 

-- 
2.49.0

