Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB046BA3D
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141879; cv=none; b=RyRVS/7kKPJ6sDUPZtETdqbusdKVwg3wzCTRYNwoTUeBtAWXEP/wKv7und6GgBiZILow1Q1Q/u4Iz0tyuR+Lhq77rBDx1nzhevv7Gi8/DGfrrYaeI4haQgiIFfoK4AP+WuI2JC48vhHL4DyYfWWB4x3kvLYW+fS7aaRICKoPjqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141879; c=relaxed/simple;
	bh=U3NTNG5ps2y829SCx0uun7nXl7uxno5CYNbsN2T/U70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MY8aBXAH1OC5WWJVBDGik6VRoNQ5vSltzviMwc8+6jTXiCQXV3hDX6xbb45yymDAzh14FufLY5cZQQtmzgkDdnyjSl79s6pM4+rV4+aeWVwt5m3cc2/fLqdefkxcMMk6sbeHkVExuX5jbN/RBNyicuflaCnFOCXql03ZDirHpQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g92CNeNE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g92CNeNE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so45699995e9.1
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141876; x=1777746676; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIYUuVoFgC4mPGBv/zDRz5d52rse0ZXYeR52JZrxie4=;
        b=g92CNeNENJNR4Z8B8hIIAW84kbD9cgEH67/Pj9fV9/QcQ3nXlVF/YcYiqtDpGnUbzi
         ud5LZQIT35BiXwzKh8sVjveQ7A8A94xZ8r1urgafszN03P2U1NTC81h1w0tfewA5s7Kh
         d/VWFNozIsWI7aTUrs+os43H9WlDzo6QFKz4/oR+vKJKL3jNIH8hTD/CCbTdPe6lDNl5
         7IN4N8/ReMsrMq9rvM/E7UD8kfMSJBkuLoUM4UwsgZueF68ts5qaOHfX2fB0GoT4qgON
         IOzWannZdIxhYmfyFa3clfpvzQJk9yppcBpqs0fdPQzeMN/P7nnxgykyFdgJQPr2WvN9
         i2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141876; x=1777746676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIYUuVoFgC4mPGBv/zDRz5d52rse0ZXYeR52JZrxie4=;
        b=DzxFfIlStX9m1QBn3XUQEwtTs/GFnJCrVgh40PD2eTgeB/SPLDIBfrmlCJ4B5otGPI
         U7C5qF88dpRXaaEbDT21I0ieEAHwtpcbxR8st0LGj5cqXP+zgZfWwDsJ41qTRX/LcI39
         /JQNlhZmpXWPD74rTk/qX5W3zv7k0GWE8nha3lE8cALJ0KAK/IcEkrqV0HXAPnAYVeFk
         1dNYw70uNobTir5odVqrGwacd9pnQ6ivpSs3MzCfEccnR8j1VKB2l7oZEk56BTLVqgOx
         ziB76RSvwXAlUIvCuHs/z5cmuHkvdAcOYIP3Sc0ipdj5S5QI5RipptfSDfYvMLdl2pRY
         /8ag==
X-Forwarded-Encrypted: i=1; AFNElJ+tYZrDxLwect4h0mZXaiHHKf8jys8u9F5aPx3kZhgy/kyz/gEkG1wJkkW9JDgbGE5Jp7J0RaNziy6oBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/KDoaZFNORypdcNRiHtkWME0SaMKj4PeeRpGeFCIz3zr3hFV
	umu2GJcyAwBIF3wYVkwk55jcXBYCRR2yz8/e68x+uCt8HB+hg4Xi0I6C
X-Gm-Gg: AeBDieudzDjSVxR8c0webHRWK7Woaa5JHi9EeWCGf7tvt1YkU+XGiw6wGuDh3z2MBiO
	91LxGKW1lERrYHv/BbXnUFSItIApU6eaHFOmsxgTug4oSQsm3wBIMESvoUROBYQ8jSuZS1EsLx4
	YOcUQM4r/8MC42PaSxMubrw9c/iK3eZS+wsPdKvQYP5lBao68yyP/aVNVhhbhq9vCTR630xdvsZ
	yESUqxuNR1YN6w8eN7whEs154Y4Ev0E3T2L5FG+OUFMNQizFSbiKLBGkWXBApe+d4e8x2GdWQrV
	aBK7aCCy4/dmK3cv7pwi3yAgjeJj+OOjggHlHmFs7FLEha+7QkK8pr/cxn2kyaDp0DfkbBER5x2
	aNXMBJzP092hIdybnhQq06R+NNO8XPJ9Y2DiEMGC3h9gLT+pbTuJ+sFsFi8SZ6qifTbt6nwifuq
	zbtcFe0xtuspa5GUysXtn0JaEKHqUpQ513hoiJl0idPGjdMQ==
X-Received: by 2002:a05:600c:1d05:b0:489:1baf:8c03 with SMTP id 5b1f17b1804b1-4891baf8d2cmr364837255e9.11.1777141876132;
        Sat, 25 Apr 2026 11:31:16 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:15 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH RFC v2 00/11] media: qcom: venus: add MSM8939 support
Date: Sat, 25 Apr 2026 21:31:01 +0300
Message-Id: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf4Xs2ZpSEMWTiYkf4NVwqMsWamwxX
 Wg0hH8X8O5xJm/ejMAULDEckxECRcu283NQmwSw1b4hYes5g5KqkHlaCMfuUGaliOQHFsGgQKl
 2mOM+N5pg3r0CGftenTe4Xs5Q/Uoe7g/CfrEtWGu578JnfY7pCv85iamQQsvSoFGostqcGqftc
 4udg2qapi9tSIVUyQAAAA==
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

This patch series adds support for Venus on MSM8939. It is mostly
similar to MSM8916 Venus, except it needs two additional cores to be
powered on before it can start decoding.

This patch series is marked as an RFC. Before submitting a non-RFC
series, I would like to have some details clarified regarding how Venus
works in order to improve and eventually upstream support for MSM8939.

1. In downstream, particularly in LA.BR.1.2.9.1_rb1.5, the buses
   for vcodec0 cores have only decoding bits enabled, as depicted
   by qcom,bus-configs property of qcom,msm-bus-clients children
   in qcom,vidc node. Do I understand correctly that these cores
   are only needed for decoding, and not for encoding?
2. Currently in device tree there is a video-decoder subnode for Venus
   node, however, for SDM845-v2 (and newer) chipsets, Venus does not use
   subnodes. Does this mean it should be dropped for MSM8939 as well?
3. MSM8939 supports HEVC decoding, however, as the patchset is written
   now, it does not work. It can be enabled, however, it will result in
   breakage of Venus for faulty MSM8916 firmwares, because the code
   disabling HEVC for HFI v1 needs to be removed, and as per commit
   c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
   this would break support for some MSM8916 devices. What could be the
   best way to work around this?
4. To attach vcodec0 power domain list to dev_{dec,enc}, I had to move
   vdec_get and venc_get later in the probe. Should this be avoided, and
   is there a better way to attach vcodec power domains?

There may be some other issues with this patchset - this is WIP code, so
feedback is very appreciated. Thank you!

Also, as per Dmitry's request, I am attaching Fluster results and
v4l2-compliance output. Fluster results were very inconsistent and
caused power collapse fails.
H.264: https://pastebin.com/C15qeq5W
H.265 (HEVC): https://pastebin.com/WDsnxvuk
VP8: https://pastebin.com/egAgEm15
v4l2-compliance: https://pastebin.com/VpBhEFc1
Power collapse fail log: https://pastebin.com/rTivMcpK

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
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
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

---
André Apitzsch (4):
      media: dt-bindings: venus: Add qcom,msm8939 schema
      media: qcom: venus: Add msm8939 resource struct
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node

Erikas Bitovtas (7):
      media: qcom: venus: add pmdomains to the struct based on the purpose of cores
      arm64: dts: qcom: msm8939-asus-z00t: add Venus
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: move getting vdec and venc for later
      media: qcom: venus: Move HFI v3 venc and vdec methods to HFI v1
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: Enable HEVC decoding for MSM8939

 .../bindings/media/qcom,msm8939-venus.yaml         | 147 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  34 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  42 +++++
 drivers/media/platform/qcom/venus/core.h           |   6 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |   3 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 187 ++++++++++++++++++---
 drivers/media/platform/qcom/venus/vdec.c           |  12 +-
 drivers/media/platform/qcom/venus/venc.c           |  12 +-
 11 files changed, 430 insertions(+), 33 deletions(-)
---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

