Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CB2217723
	for <phone-devel@vger.kernel.org>; Thu, 17 Jul 2025 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735301; cv=none; b=S2mDELhXNKtPTDHz67YXUarhpo9ns7yj/0ljC3SwteTdW37ad14unNt83pmjj8nEs1IaLThB4wCMCh2UGS64qNp9Mf5YWOJjzl6ANFRs8CNUMhC7pnUDvQ3LnD2jhV8fmjgR3907lHyc031xaUmGNbpyr6JlvoAl4g+GLyH4fyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735301; c=relaxed/simple;
	bh=dxlncHAvtyo7S9r9a4Bw93GIWIXwdIGumSxNnKv+9i8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gH5u0HlsNo9XfdU2JkKRHBZ5ZtuDDEHHX0OZGk00LKmWHzL5e/5TwlEgaNiXenkDVgeUIsBFcc08sNuBnFy/31H/tjEuSfYdWr1QwVigD8NdCS2mz9vyleSPyGUHoGEQWNW6tRH7XEBCzKgGO+1A+TWqIArbqJDzFvHcNlf67ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=K8wUqLUZ; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="K8wUqLUZ"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so918035a12.0
        for <phone-devel@vger.kernel.org>; Wed, 16 Jul 2025 23:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752735296; x=1753340096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTrMaLkKQohvWqI8MgITB/gzL3ZwR7s1HNLPElehzEg=;
        b=K8wUqLUZ8iLeK8KmcoB3ezrCrTEqzPGzfRzLkjtphiTPhb3fJ8g9Q2rt51buQdeLW/
         Sa43YXgddOt5wekxt52GzISUk/yNYEckvqaBYQyf6bK//Uf2/7XMxhsdxW9YhPggAmIk
         RjaaFqhTKjZuelnFw5sqdJlP/U4VB6zzkvxdrHsfrAr/tRmKxqPB0L7swO0xVm5wbQwT
         clShcnUI2MEttfKL4NO6ZgbURlBq99jrBDPPBYyfA8xE9o88p/OtIjaJEN3k2fref+Cp
         Dt87EiTnsP3EIXSgrt9hQX5QxOAsr5mhQ5lx4gJU1TCBg+j2h8jpitFmVgyCBO6BTHlK
         zXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735296; x=1753340096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTrMaLkKQohvWqI8MgITB/gzL3ZwR7s1HNLPElehzEg=;
        b=SrTUgmFD5upTi1EiYFPcLV2zKBEONO83R1a4Rso9VYPbJlE4WO714NzY/gZ324kG1w
         st2uxMo+hI0Im1Lwwl0hRHoltpAVvysyVTwsFOR6gaTATEU81W8ThY+zwYwvNJy4BbP4
         nRTAOVhvsiWsFiMPqwm4WDgJNJzwVToaBVYhgwD4qWH8KrYP+tI6x34U3l0mINzf0uS0
         NmI1CncE9X/8Fpv0Jh4APGBD57wVia98Wo8i8AFcqNV1M8Ml0SZFpxAZTM/rLIMql4Yx
         pVdfSACwfltp941m+ewnvIWbvLocwLmpFlyrpNHx2liGR1WirGUcSXaiKsWWZygiO9vC
         Vikw==
X-Forwarded-Encrypted: i=1; AJvYcCWwrcFK/JI0N436+K4jA4fxEcGt5xJli4Rea8Zu8wAWcU8q21ZM5E22pCaOQqAVkt1ZTXWuSwRr110AjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFHQZ0SB9Om+uzwUiJ8L7BT1/l8r3ZVWxdLa5sJ5TzZx8u3sv3
	mbk7h3GKQzJAFE2ZVeMfeO4ZN/7Q8UG0nb7+5iWIZR5WFd0OFZQqZQl9TA3K+gAIXwA=
X-Gm-Gg: ASbGncuQgu6/+OPXE+pOXjgNLk8zYNeDqkBTtMGVIYY9WWyR4GanpwPAHCQvkmrMCAD
	oZbBzdzNRUTEqGRuNkbETOC+X2jsX3vTfaixWbt/hHADvueSo6edG3VAGO7Si4OnVGecnvQGGpN
	8U5aYIDo1STIXtSOF4cCq819XwroxW5LmujbikWkCuVct54vfv0PDLzHpWQrKpdo90wV0IMu6G4
	y15tdWPbLFOuw1R/l5881ajCt3hE9wFZ604h/LUokxq7a/Vdnc26zvyhrsgVWH21/6K3hirrRhf
	3mQsi+DzsVMQ9bG2xDaiLqCimKgB22EbsZtee2YlyP4AYvzeJMww6GQ3f7pfDwKYVpLlX+5xIpV
	fVag1+PdxUQfqzpGblsHIHstT9j+njtFWo8t81AngkTxhjg1Z190gphepYOqoI2fL49UQ
X-Google-Smtp-Source: AGHT+IEPE7jcvTZWHa1uq9a7/be6YWGVsD4XhPzTsJz+8V3TnN9RduahxJ0ofrGWhTknThJCepAl8Q==
X-Received: by 2002:a05:6402:27ca:b0:608:6734:7744 with SMTP id 4fb4d7f45d1cf-61285916a89mr4839700a12.7.1752735296237;
        Wed, 16 Jul 2025 23:54:56 -0700 (PDT)
Received: from otso.local (212095005146.public.telering.at. [212.95.5.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612477e1d2bsm4688882a12.34.2025.07.16.23.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:54:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Remove double colon from description in dt-bindings
Date: Thu, 17 Jul 2025 08:54:43 +0200
Message-Id: <20250717-bindings-double-colon-v1-0-c04abc180fcd@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADOeeGgC/y2NywqDMBBFfyXMugNG8IG/UlzkMbUDOmmTWATx3
 xtrl+fCOXeHRJEpwaB2iPThxEEK6JsC9zQyEbIvDHVVN1WnO7QsnmVK6MNqZ0IX5iDYe2290U3
 vtIXiviI9ePt17+PFkd5ryedrBGvSKS8L50EJbRn/Fy2Mx/EFYecOOZgAAAA=
X-Change-ID: 20250717-bindings-double-colon-8d1bda158c1b
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Martin Botka <martin.botka@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robert.markoo@sartura.hr>, Shawn Guo <shawn.guo@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 krishna Lanka <quic_vamslank@quicinc.com>, Iskren Chernev <me@iskren.info>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, Danila Tikhonov <danila@jiaxyga.com>, 
 David Wronek <david@mainlining.org>, Jens Reidel <adrian@travitia.xyz>, 
 Priya Kakitapalli <quic_skakitap@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Georgi Djakov <djakov@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752735293; l=6310;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dxlncHAvtyo7S9r9a4Bw93GIWIXwdIGumSxNnKv+9i8=;
 b=4vFdUo3rnWGztC9lQOpPPSWNfnpRHIT6umk1THV2EBX6PKhs3v0lEPSq5L+diUpMVJlkC6n3g
 Try9PArneU4Bu8kIZhL6IqpJ6AVcuIlqKrV2w2zS0mlq+42R/vcb1Lo
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As requested by Rob[0], remove the double colons found in various
bindings with "See also:: ".

[0] https://lore.kernel.org/lkml/20250625150458.GA1182597-robh@kernel.org/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: clock: qcom: Remove double colon from description
      dt-bindings: interconnect: qcom: Remove double colon from description
      dt-bindings: soc: qcom,rpmh-rsc: Remove double colon from description

 Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6350.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml            | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml            | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/qcom,qdu1000-ecpricc.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sa8775p-gcc.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml   | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sdm845-lpasscc.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml            | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6115-dispcc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6350-camcc.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm7150-camcc.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm7150-videocc.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml         | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml        | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml           | 2 +-
 Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml         | 2 +-
 Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml  | 2 +-
 Documentation/devicetree/bindings/interconnect/qcom,sar2130p-rpmh.yaml | 2 +-
 Documentation/devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml   | 2 +-
 Documentation/devicetree/bindings/interconnect/qcom,sc8280xp-rpmh.yaml | 2 +-
 Documentation/devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml   | 2 +-
 Documentation/devicetree/bindings/interconnect/qcom,sm8450-rpmh.yaml   | 2 +-
 Documentation/devicetree/bindings/interconnect/qcom,sm8550-rpmh.yaml   | 2 +-
 Documentation/devicetree/bindings/interconnect/qcom,sm8650-rpmh.yaml   | 2 +-
 Documentation/devicetree/bindings/interconnect/qcom,sm8750-rpmh.yaml   | 2 +-
 Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml | 2 +-
 Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml          | 2 +-
 70 files changed, 70 insertions(+), 70 deletions(-)
---
base-commit: 4d088c49d1e49e0149aa66908c3e8722af68ed07
change-id: 20250717-bindings-double-colon-8d1bda158c1b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

