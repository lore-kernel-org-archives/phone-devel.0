Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749B313557
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119708; cv=none; b=FZd/XOHdMJqB0MZAEHOWfpw5KYeuemQwBGaoL/5t05UfcPb6hd2k8YltBBbAAISghnGKGrz5MNlFvtKJapaFe/bn9JhjtDFLaYvGe+jJarYcp+jq6QOSaLQKfcMR4gyxwyy0rockIjLcUXOLEo2LaNg9swLuHQAU8HGuE1o8ToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119708; c=relaxed/simple;
	bh=/8v081eYKCKOZDNGWsjdgufXOvmbM2u274lti91nqBc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KG/PAAayzPTFBqvLwpG63z80x3nOwcCy1uB6vW3yZqhg1bhbO6+S02Tc+z64+Ejx2mvLJ7VGD++aqgWXo8j6oQcYqg3T2lgbY1ZtuQAd+iY3HNE7XVVX1k5D4gkglyGs/7rTWrsQIrNuox0La8TfT5+EYt8e80htQEIxjMkBAFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1itAnsS/; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1itAnsS/"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b736d883ac4so87338066b.2
        for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 03:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763119704; x=1763724504; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZrsM3gSytE92YEMxHDpdQzx1aWK1/po5BBG7X3Ts/g=;
        b=1itAnsS/F8HTIKsTQTG8edIFH4wgNIpA9EUTqFnGlUUDyrhlmp/qQeTxi/f87roxaG
         bbZMIxlhHlP05E2DSpNP2Cnhld+AMwFsyDUgir/AlrAyO7dRKHTOs8HHc1IwyvfVRg4P
         oowNadK+Yw+TZXPEltudnFSCLyARV9zWqTieef5bh5ddk2oHfvxULvQ8lRyN869QI0xR
         eDTMrHj0Md2+ZGp1R3gznriF1ZcXOx3KRJBXSnpEc0JM9UMQ5EXvGDrvaMFeeHf1VD+7
         qhAryNwH7GYvpGgYYteq7dOCoKBCQcn5sQ7TaG73pbEBSwhMDCMV1b8C/HHs/F2Imbaa
         6Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119704; x=1763724504;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZrsM3gSytE92YEMxHDpdQzx1aWK1/po5BBG7X3Ts/g=;
        b=gC0CKZjlxx2wRvojVPYkTk7W5DPphNZQkKQoUOuVGo/+KMnmERI3KXJq7/tfqeMFGe
         XMlgHfenSIsiredD3zSN6YWWKO/Mq7aHUoBmikZNx9k4I3yLEiikrb6wDafCvdla/rdE
         tnFq1u0dThQD411bbmIEENb/JInrto1eMU1OaAL3UrK2f+MIj9PK9pUFsKPRu2k7+hPh
         rLfuUhqtEU0jA37siH/a188fcjm67iBWlwcchyUazU4xrGWl6PkUsVwmoORHgtEVFMDf
         2uVprEAJ9zXl64YA/T7kYK1JulxcaTkfiGRcCKY2L9KVYRfmNMYlXloFKA5s4rGU8R/n
         Fogg==
X-Forwarded-Encrypted: i=1; AJvYcCVZx0odvL0qjvAblHq3r3oj/TUHz+qmN1y1N5A+xm6e6xcfbJXP75uQkx3wJF9wiDf6LSYJ55jS1aHwQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8RC17wj1gGpnAFRzM70Hl9uqU8e3MSLiNL3R0MHtO/fykQ2vJ
	on9splHAsvDGHVf7lBRu5pjgYVTzwj39+n4WxlcrXqjmnSm7JF73OOiPTploF4r2cNE=
X-Gm-Gg: ASbGncubxh6KVWX1bOXaXK77GyzKJMgSbmEXJqIAnWq2yk99Ruk9Pmzo+ourk21GaZV
	M19qskAB5BdcWl44Q4JNPs8NkDP5I64ml7OaF092d2zl6hb+A20I0oA13FzzHx1yu5kIrg0Ka6e
	dwPay5P5YWH8u73m3b/RLkTeyNlsAXoumnEUhPtOeB171Uy25PLFAlscPhebrUVAXzLhEehX8u1
	6dgmoELB6wiYYOniE9eVbtse9EQxMmPeJ8x4YL3r9tQJsqngyCVcGgob/Zrvq0+cMludSpTGmEV
	V1oh/y0ZUdpPmlJSOvRi2oBsBnPoV+DFTGcqqs0eZemUzqV9DxAJSQ+9JrZmQCs8mw7CA45ck5C
	g4r+C++n01l/4RNr3ZK6Vbk5CaiCUkMRBcpl+5qXI7QP6/zCg6V74TgIYo1zJuYdHH/yexM2Jvd
	hppHg5/74Fa3fB1Xlr/EkTxJgsYSNEir3YzDp0k6csMFJ8So+QkQGYIXUHJ0Z1d2yrp9td70M0z
	4ES/S+1cmSXQA+HMt3dhwGAwXCXQea8mQ==
X-Google-Smtp-Source: AGHT+IHkMtKAsDivftMze7owOgMWMjSMGYTEya3fZ0IaGCwoODR/zJDYr0nmHilXmU636PkOl4jIQg==
X-Received: by 2002:a17:907:3d87:b0:b72:9961:dc04 with SMTP id a640c23a62f3a-b736792fdeamr279925866b.28.1763119704520;
        Fri, 14 Nov 2025 03:28:24 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm366887766b.70.2025.11.14.03.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:28:24 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Add CAMSS support for SM6350
Date: Fri, 14 Nov 2025 12:15:23 +0100
Message-Id: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEsPF2kC/22OQQ6DIBBFr2JmXRoEJbWr3qNxgTBUFoAFamyMd
 y/VLrt8k7z3Z4WE0WKCa7VCxNkmG3wBdqpAjdI/kFhdGBhlbU1ZQ5ITvKVESZcS6VRDm8F0ymg
 NRZkiGrvsuXt/cMTnq1TzcYRBJiQqOGfztfK4ZPIrc/gKo005xPf+zlzvxv/luSaUCK4FE4Jfp
 NY3I22cxuDxXPLQb9v2Af6l9PHdAAAA
X-Change-ID: 20251024-sm6350-camss-9c404bf9cfdd
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763119703; l=4454;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=/8v081eYKCKOZDNGWsjdgufXOvmbM2u274lti91nqBc=;
 b=rGV1bCqA0QoOB4J2pHzjAWoClMZOmodaUbYXbxr2puh0l23HeNXM95pNlZAx+5vRtUHaEAD6g
 njOXGF3IURTBg0DuXp8g+iOA48x7S5Fvq8ANuLgKbtGDM58CEwaSHjW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings, driver and dts to support the Camera Subsystem on the
SM6350 SoC.

These patches were tested on a Fairphone 4 smartphone with WIP sensor
drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
far as I can tell.

Though when stopping the camera stream, the following clock warning
appears in dmesg. But it does not interfere with any functionality,
starting and stopping the stream works and debugcc is showing 426.4 MHz
while the clock is on, and 'off' while it's off.

Any suggestion how to fix this, is appreciated.

[ 5738.590980] ------------[ cut here ]------------
[ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
[ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
[ 5738.591081] Modules linked in:
[ 5738.591099] CPU: 0 UID: 10000 PID: 6918 Comm: plasma-camera Tainted: G        W           6.17.0-00057-ge6b67db49622 #71 NONE 
[ 5738.591118] Tainted: [W]=WARN
[ 5738.591126] Hardware name: Fairphone 4 (DT)
[ 5738.591136] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 5738.591150] pc : clk_branch_toggle+0x170/0x190
[ 5738.591164] lr : clk_branch_toggle+0x170/0x190
[ 5738.591177] sp : ffff800086ed3980
[ 5738.591184] x29: ffff800086ed3990 x28: 0000000000000001 x27: ffff800086ed3cd8
[ 5738.591208] x26: 0000000000000000 x25: ffffda14fcfbd250 x24: 0000000000000000
[ 5738.591230] x23: 0000000000000000 x22: ffffda14fc38bce0 x21: 0000000000000000
[ 5738.591252] x20: ffffda14fd33e618 x19: 0000000000000000 x18: 00000000000064c8
[ 5738.591274] x17: 0000000000000000 x16: 00001ae003667e9e x15: ffffda14fd2a07b0
[ 5738.591295] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
[ 5738.591317] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffda14fd2a0838
[ 5738.591338] x8 : 0000000000057fa8 x7 : 0000000000000a16 x6 : ffffda14fd2f8838
[ 5738.591360] x5 : ffff0001f6f59788 x4 : 0000000000000a15 x3 : ffff25ecf9d7e000
[ 5738.591381] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000baf5c100
[ 5738.591403] Call trace:
[ 5738.591412]  clk_branch_toggle+0x170/0x190 (P)
[ 5738.591429]  clk_branch2_disable+0x1c/0x30
[ 5738.591445]  clk_core_disable+0x5c/0xb4
[ 5738.591462]  clk_disable+0x38/0x60
[ 5738.591478]  camss_disable_clocks+0x44/0x78
[ 5738.591496]  vfe_put+0x7c/0xc0
[ 5738.591512]  vfe_set_power+0x40/0x50
[ 5738.591528]  pipeline_pm_power_one+0x14c/0x150
[ 5738.591546]  pipeline_pm_power+0x74/0xf4
[ 5738.591561]  v4l2_pipeline_pm_use+0x54/0x9c
[ 5738.591577]  v4l2_pipeline_pm_put+0x14/0x40
[ 5738.591592]  video_unprepare_streaming+0x18/0x24
[ 5738.591608]  __vb2_queue_cancel+0x4c/0x314
[ 5738.591626]  vb2_core_streamoff+0x24/0xc8
[ 5738.591643]  vb2_ioctl_streamoff+0x58/0x98
[ 5738.591657]  v4l_streamoff+0x24/0x30
[ 5738.591672]  __video_do_ioctl+0x430/0x4a8
[ 5738.591689]  video_usercopy+0x2ac/0x680
[ 5738.591705]  video_ioctl2+0x18/0x40
[ 5738.591720]  v4l2_ioctl+0x40/0x60
[ 5738.591734]  __arm64_sys_ioctl+0x90/0xf0
[ 5738.591750]  invoke_syscall.constprop.0+0x40/0xf0
[ 5738.591769]  el0_svc_common.constprop.0+0x38/0xd8
[ 5738.591785]  do_el0_svc+0x1c/0x28
[ 5738.591801]  el0_svc+0x34/0xe8
[ 5738.591820]  el0t_64_sync_handler+0xa0/0xe4
[ 5738.591838]  el0t_64_sync+0x198/0x19c
[ 5738.591854] ---[ end trace 0000000000000000 ]---

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Remove prefix from interconnect-names
- Move 'top' power-domain to the top of list
- Update regulator supply names
- Link to v1: https://lore.kernel.org/r/20251024-sm6350-camss-v1-0-63d626638add@fairphone.com

---
Luca Weiss (3):
      dt-bindings: media: camss: Add qcom,sm6350-camss
      media: qcom: camss: Add SM6350 support
      arm64: dts: qcom: sm6350: Add CAMSS node

 .../bindings/media/qcom,sm6350-camss.yaml          | 349 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 165 ++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 249 +++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 891 insertions(+)
---
base-commit: a92c761bcac3d5042559107fa7679470727a4bcb
change-id: 20251024-sm6350-camss-9c404bf9cfdd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

