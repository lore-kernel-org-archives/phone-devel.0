Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F134752D
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142822; cv=none; b=Li1VxGsymCwvmqqAgcmAOn4StFCBLoKztNBwO/68oTiHz0hBhgclp0ogxKVuwDvtfC9iW41LobNRN3/pU13HYu3+6yLk4ZYl95VhboiiqrQV3ZoVGfojAM5GKwbacZxEq9duFpifN1Odd8uErNrzmhrou1RveepUG+VDmvW7qKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142822; c=relaxed/simple;
	bh=D3osnMe3vp6rwSX+97IPBj9Y1Qkke5LagVWMBNxNw0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oRyj2B8JUu5b89VcpMF4B50VCwm1vGIrg9tMRpbTT/0HusxsvdssyUtMt+zYbO+NJabHcYRWRcRGk/7P52++wSlXl3g3l2MqlEOEjvPk64REkMZCt2cLeKj/zX0iIezlnj5YWCKF+h02kEvwo2a0VbnLIEHxmH+zMfY1Uz8J2E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaAAXT+V; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaAAXT+V"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bd5c582c6cso5411027b3.1
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142816; x=1778747616; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u8Sk4ijFe93HuTbksMx/E9qQulVUf+80VobQVOkUoSw=;
        b=TaAAXT+VyQSSbKz0IHsLjhmRGLd7Zy9A820pTZh3TlYK2rtcOt3PglRiFf+q6JYHA8
         4dThlogZLucG0lHc1F3BLefcKjNacXtzq7YweV2z2Y10JiBjylnB0iAHIz7IFju8PKmb
         RvuSTsyCRcRpvE/L3k4aD0iyJzwGX/dw3PqI1uY8mnU4b16dg7u0vA3/dq0ZIVnOnuMw
         yNdwxOr1m8nqKzUE+5Euaqxgogi9jAr0vQhA7rIrOWwO8J069fiS3XZBrfsdHwhjB2Cl
         ouHDBEbJLG91KNQbDUwAqLxocxhneEWXLWs7eMp6a0Gy79QyyjAFXRzLBun3XZ5mbXmX
         0RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142816; x=1778747616;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8Sk4ijFe93HuTbksMx/E9qQulVUf+80VobQVOkUoSw=;
        b=JbfqRoTAfszMoqbJZMq4cpoNLqIkIBfbJmPfK7YUEZsc9Z1bLQn4NvliM1/QvEK1ax
         G78g8VI8SggqksYnUFjizlKxvgb7HjgavJopN+7hgfocP8ZjcVb3eXbDlYmuhCly7gUh
         2+1Js3WQYx/SopoC6FHbJDzoIb99ua1Nu2NQR6NXoP1Hg69D5baSvl9+nZXKmNBYE6Wl
         YDX/vNYatsuszbJytfg9lSCeycE4Xhdy5Xc2C7m9o8Qh4LiaLljrpCtBIl20mx+dcZ9r
         ggBQf7nMKjeplMcWWMsIuxI8AMmqWTeFp93yyQwwyGzqLzqKOvPfOYCCme9hbsEWCly9
         gDCg==
X-Forwarded-Encrypted: i=1; AFNElJ9QW4gUggxEStP3poDM+7KGvHpwk16PNveltcPh/HGp2ocOJzPMecR3mL9zAYmsJWBICk88mUhYSZxuJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS3vdQLhNBUW1mwWZWaRDv8d/BMMSKWE47n8yo1oSmZK/JPDXz
	lsajcrbq5h8NevdyGlm2StzTDzrfDsGXc7kCw8IRCgg/yQMxrPz5XiB3
X-Gm-Gg: AeBDiesKZqlprpQOhrHduQm8JyUmUqyXFnV8ARPBcNqgOcKRqEUTz6B1DjzytTRdfI/
	PTgG9d6aqlCMcXvF+iIEqaGUQ3YBL1Os4mu3NTfIs0i2zDY144FmlfBweBo1nYmarVuJOltNCTc
	bNykDfxMmHZVTe1VkliUR+y2FNuMvvRBggyxxE3pT/WtfgW+gzkgFFtOMlsMObcVRFvbDOvxbIZ
	DaQYpK1LW8SBk1eAemrB+CynQUCbcxFWteak6hlH6phGsMZ71S/RAWQQLqGiZ9TQmout0WPnCxW
	x60V03ymV08l8fvn5KSKGoVf0WmaeFAPu/BleCXdigL3ZsidX8RDZAM99iLrzQI8zTN/t9cWtoS
	yjh5slcVfRI+6LX4oEj6nA4g9vGMJeOFMTKK/VkZVcrSA5+kgB/wOGfmgyzN8urvoHFvWxckU5D
	wlEFVW5iDWVHWAUVRrENYJxNJtafP3e73HoEHy
X-Received: by 2002:a05:690c:e04e:b0:7bf:424:bf4d with SMTP id 00721157ae682-7bf0424ed8bmr19632797b3.2.1778142815746;
        Thu, 07 May 2026 01:33:35 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:35 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v5 0/8] media: qcom: venus: add MSM8939 support
Date: Thu, 07 May 2026 11:32:15 +0300
Message-Id: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PQW7DIBAF0KtErEsEA9gmq9yj6gImQ0JV2xEkK
 FHkuweni1qt1eWX/ryvebBMKVJmu82DJSoxx3GowbxtGJ7ccCQeDzUzENAILRve576zyvJCwzX
 zFJCjAIMaWx0csXp3ThTi7WW+f3znfPWfhJcZmhunmC9jur9Gi5x7//lFcsGdsAEDIKhD2B97F
 7+2OPZs9gssBDBrAlQhNJYMeNWAaH8Laim0a4KqAnSdtMb71so/gv4RjFj9QlfBWh0MeQCHfil
 M0/QEFbT/WooBAAA=
X-Change-ID: 20260416-msm8939-venus-rfc-c025c4c74fae
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

This patch series adds support for Venus on MSM8939. It is mostly
similar to MSM8916 Venus, except it needs two additional cores to be
powered on before it can start decoding.

As per Dmitry's request, I am attaching Fluster results and
v4l2-compliance output. Fluster results were very inconsistent and
caused power collapse fails.
H.264: https://pastebin.com/C15qeq5W
H.265 (HEVC): https://pastebin.com/WDsnxvuk
VP8: https://pastebin.com/egAgEm15
v4l2-compliance: https://pastebin.com/VpBhEFc1
Power collapse fail log: https://pastebin.com/rTivMcpK

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v5:
- Undid the merge of vcodec_clks, they are split back to
  vcodec{0,1}_clks now.
- Extracted a dev_pm_domain_attach_list() call into a function of its
  own to reduce nesting.
- Added missing "power-domain-names" required property to device tree
  binding.
- Renamed vcodec clocks and power domains to match other Venus bindings.
- Reordered commits and grouped them by subsystems. Now first come DTB
  patches, then clock, then media.
- Removed "status = "disabled"" in the device tree example.
- Link to v4: https://patch.msgid.link/20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com

Changes in v4:
- Removed vcodec{0,1}_pmdomains and merged vcodec{0,1}_clks into
  vcodec_clks instead for MSM8939.
- Inlined video decoder and encoder device tree nodes in the driver and
  removed them from the binding.
- Kept vdec and venc methods for HFI v3 separate from HFI v1.
- {vdec,venc}_get() are now called as early as before, since it is no
  longer needed for us to attach power domains to dev_dec and dev_enc.
- Link to v3: https://patch.msgid.link/20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com

Changes in v3:
- Added missing vcodec1_clks to resource struct.
- Removed enc_nodename from resource struct since we include
  video-decoder now.
- Link to v2: https://patch.msgid.link/20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com

Changes in v2:
- Enabled GDSCs during encoding as well.
- Merged vcodec{0,1}_pmdomains_num into vcodec_pmdomains_num.
- Reworded commit for marking GDSCs as hardware controlled. Same
  situation as in cdc59600bccf ("clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock")
- Clarified the reason for missing firmware-name property in device
  tree.
- Clarified the reason for moving vdec_get and venc_get for later.
- Link to v1: https://patch.msgid.link/20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com

To: Bryan O'Donoghue <bod@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: André Apitzsch <git@apitzsch.eu>
To: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

---
André Apitzsch (4):
      media: dt-bindings: venus: Add qcom,msm8939 schema
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node
      media: qcom: venus: Add msm8939 resource struct

Erikas Bitovtas (4):
      arm64: dts: qcom: msm8939-asus-z00t: add Venus
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: Enable HEVC decoding for MSM8939

 .../bindings/media/qcom,msm8939-venus.yaml         |  79 +++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  23 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  43 ++++++
 drivers/media/platform/qcom/venus/hfi_parser.c     |   3 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 149 ++++++++++++++++++++-
 8 files changed, 312 insertions(+), 5 deletions(-)
---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

