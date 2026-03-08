Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0727280F;
	Sun,  8 Mar 2026 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772981577; cv=none; b=AM4kc8wmouRVvDJWhYcfA20DdOWb3VX9HbAONgT0wOD1hw9NQh9NSy07P/vvDL4IMKMZaFij/JTQTo8DibNV1TIpwhfBFh7i6jSBoJSdjl5XChY6HGjenA2LUFXqnQMFTERGnX0WleZjTEQ3nuTYCk4xQcmWrOWl9Hww0dw73y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772981577; c=relaxed/simple;
	bh=wQ7u13m0ex1l7LW2+VlBPd+UnM7kt74ULo4GFRhXDqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BlLw9t2JSf7KWZrGgDk0KfIWQCgNF1GYxBHiacSfAmp8VJoblrNrWFhKEx8M7G5fgftgiunUrrQBz+fbR0kjLSYRrWy/AO/ichy3/anO5X5EFvLqZXOSIGGNjhe7/YCe7a9FK4kP8NHQcGh7bg/nILh8krRAs+ZEnutryFz99Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eydfh4+9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eydfh4+9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D22BBC116C6;
	Sun,  8 Mar 2026 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772981576;
	bh=wQ7u13m0ex1l7LW2+VlBPd+UnM7kt74ULo4GFRhXDqE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eydfh4+9YlmWGtHriVpXVt5QKgbtUmGX5SbVJ2dkDPuPvZu01sBGGYlVltPYQZWIL
	 7qqbWZFux1gquLqiOW3bKwwYJTHtgh26HxhwwVf8ZzXeVIFI6VItHQECJImJl2vM7e
	 3qXbam++60Sq4CVy4SXMr9ws4DrpV6QMUt9VQT84vjHZ3xSVvvzbAi1muHKx+JiXzZ
	 5oPl/AAQPqgRFLJuIQnqRnk5p16dHzM1QOawRTHE0+rCnki7jfCT7jDgXgYtvsplgR
	 nyVxejuKb6Rn39l2Q0M0SO7j64Jn3iw9L+MchVrxXU8KJm2v1A1f7hf2/EGMgDuN2/
	 Y3BWyoq081Vvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCC8EA8525;
	Sun,  8 Mar 2026 14:52:56 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Subject: [PATCH 0/6] Enable new features for flipkart-rimob
Date: Sun, 08 Mar 2026 16:52:40 +0100
Message-Id: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQ5AMBBA4avIrE0yWiFcRSyKwSyUTP0l4u4ay
 2/x3gOBVThAnTygfEqQ1UdkaQL97PzEKEM0GDIFWbKosqwder5wZLcfygHJllWed9YVhiCGm/I
 o9z9t2vf9AGG4EOFkAAAA
X-Change-ID: 20260303-rimob-new-features-037944b3a620
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772985180; l=2259;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=wQ7u13m0ex1l7LW2+VlBPd+UnM7kt74ULo4GFRhXDqE=;
 b=DyAla0iz3gxfGuxFSxXh9oTIG5bqNawVTwKQWHjPRBDnN70k+mt1r1WrfmpW56H6yHoRF9Sc/
 cpB1HrLoTviCcxxzcWC7AdMP0pSqiuXo4WgbtvyRPE5zOpvtB5Rn2kK
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

This series enables a set of miscellaneous features for Billion Capture+ 
(a handset using the MSM8953 SoC released in 2017):
- Panel and GPU
- Touchscreen
- WiFi + Bluetooth
- Hall sensor 

Patches 1 and 2 provide a driver for Novatek NT35532 and its corresponding
devicetree bindings, required for enabling panel in DTS. The remaining 
patches are all DTS changes, aimed to enable the features listed above.

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht
Cc: phone-devel@vger.kernel.org 

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
Cristian Cozzolino (6):
      dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
      drm/panel: Add driver for Novatek NT35532
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable WiFi/Bluetooth
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable touchscreen
      arm64: dts: qcom: msm8953-flipkart-rimob: Enable Hall sensor

 .../bindings/display/panel/novatek,nt35532.yaml    |  66 ++
 MAINTAINERS                                        |   6 +
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 152 ++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt35532.c      | 767 +++++++++++++++++++++
 6 files changed, 1003 insertions(+)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260303-rimob-new-features-037944b3a620

Best regards,
-- 
Cristian Cozzolino <cristian_ci@protonmail.com>


