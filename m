Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1222B1D416C;
	Tue, 21 Jul 2026 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637215; cv=none; b=tqQiA2Vh4TLCGvxyhosUQ8if1bam5+tpK8qXjCDsYBAZq47bQCxJW2QoVREwzE7FEGdGaGPuLwRMBSKTE9Kff1Ws91+p8chi9aie5GmbIeInuPA+glHCGLqvr8JCfu1ToI3kru407wewZSDFgIZ1m+UCRRsjzvpLmvlZKL8IzVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637215; c=relaxed/simple;
	bh=ns1LjmqdvwTkJNn1DSFszH60IOI7yr4JlPHwBH6lcqg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mPAKFfDGHkXt/C6HiMe61uZZwNWmwbEkXzOCguXIFQ6cB0uB8RqrRZXxJoQEgrUWgJbtha+miuL4upusyuw1Yinmag2L1Fl34txTHY96E4Y14gtk4tPMsK9SxQyNYSDk/vkB8ARx12bFrRE667CpXwUCPhevuTmFlDitLBqJHEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwXRkZJE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwXRkZJE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE03DC2BCB8;
	Tue, 21 Jul 2026 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784637214;
	bh=ns1LjmqdvwTkJNn1DSFszH60IOI7yr4JlPHwBH6lcqg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dwXRkZJEsYCZH/FuTZuHk0ehnQwSCzuWy+x0rV9RthSkviP8m9IJVJTaht352te2z
	 8CECpnVkroVX08eXgME/QIIPpKhKC2VNtd1K1w9rhY+Zh35ruVGsB3Nf4BDh4gCrDU
	 tcFnTR2ugVJ6ngOGpdpLbC7jsS8SXXz2efJQV0fjt1HrhbOCH2U1bifCwSLbXH+R1v
	 vnUmmU3gXcFYNVEt++OubX/clcj7Fo+GZ7rfHrtIN4Tp9vIPwfSvu/xJVGlFG/kpqY
	 3O0C7tje84pwoSvB9zreryL/ExnldhGTf5YTR01JW7BcKhy6GlDPAaFWXkBn1iBxT7
	 /ZcUenZRk83Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885A0C4452F;
	Tue, 21 Jul 2026 12:33:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v7 0/2] Add initial dual front camera and rear flash
 support for Pixel 3 / 3 XL
Date: Tue, 21 Jul 2026 14:33:28 +0200
Message-Id: <20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33STW6DMBAF4Ksg1nXl8R82q96j6sLjjBOrDaRAU
 dood++QLJKwyHIsvoft51M90lBorNvqVA80l7H0HQ/NS1WnXey2JMqG51pJ5aQGKw7lSF9apLi
 nIYoYgg+YrQ9ENZvDQJk/WPLeP3jelXHqh99L/AzL6jXJAKySZhBSqMY2TjoLFt1bOZbpNf3VS
 86snlrF1gB6HyIimPRo9b1Va6vZknIog4wOQD5ac7MNhLU1y399ighKO2/Vo7VPrWUbgg06A24
 8rfbs7qySa+vYxkwGAlI2zd1dna8lDPT9w11O1yZuVbbVJdJJLz6xdNtd3IueH0A3xYmbF0rGn
 GRGF2zT8sVxGsaRROr3+zK1FR/EK68jKo9JB9kQSHQQHRoklylHSIgq80bO/5gh8ZdcAgAA
X-Change-ID: 20260315-pixel3-camera-a9989bf589ee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3089; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ns1LjmqdvwTkJNn1DSFszH60IOI7yr4JlPHwBH6lcqg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqX2cddAEKBzCHafHIKaCEF07nYk08q8x+Rk1NP
 udUAHyfm3CJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCal9nHQAKCRBgAj/E00kg
 cgK7D/0QUCUh801LmQ6Cbx2MeAt7X6XG1KDdrbCfBObYl6HrqTqHl6Fg4tb9iN8cLC4pcusS8Zv
 yURD65BnPlMT3X/5Y+u0t32ORKffyWjvbxTAgyLTypcvKc6BcS0BHpPxCMK4o3j+KyKhtVf33/Q
 90unrndv/YpVoG0gTIlrvo5SyM0Xwat4F1w9wDuIyXIVWukxWKfgtNZYiyLtn6d6dIg+KMPslFa
 XRXLKWwB9i+iNF7FXyKBIGcIRLy4FTIKC8572lDH6oBwVrA0T3xZbj2RmvEZpmBvOpLVnRWYPQ3
 S/uzn38dIG8UTYJmHS+jcwLxioOAYQ3m4J58eylZ8DWKELLiAbU/ntrskJriLF0/kuVm+Enr8k1
 zrZjcUSCNVRiviB0Gb+QV7idkDe0JJGESAbxOXvc2qAWSfzzTt6JmwJ71WwzEbKvJ0k7aH29PM8
 jvSgVsIYPvEsospWz2vdrS9VmfbPIYGIJ9Nd6mz6DqBwtS8knHEWprMTlp8YpEVn2b8GtmDMA0C
 ThGVi2mNiC849O3hm9fYcePOs4l1AeKXBIbgrNsOXIon416Mnd1HQdCgS3p8wnopX9hT2z75tas
 kquFitI/3CITdwPREpbgHE7xEcFg/K2ZC6cRWNnryqz7KyCaT6Uca5r+Q8M6Bzl2Xa/pCVkOiFL
 Yq8g3VFxIwxLZqA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Describe the dual front-facing IMX355 sensors (standard and wide)
and enable the PMI8998 flash LED with hardware-accurate limits.

This brings up the basic camera topology and flash support in DT.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v7:
- Depend on the
  https://lore.kernel.org/all/20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com/
  (Konrad)
- Sort the renamed regulators. Why Mr. Anderson, why. (Konrad)
- Link to v6: https://lore.kernel.org/r/20260720-pixel3-camera-v6-0-afe419bef476@ixit.cz

Changes in v6:
- Remove forgotten bias-pull-down property from cci0_sleep node.
  (dtbs_check)
- ..-regulator -> regulator-.. (Konrad)
- Rename camera -pin to -state and remove _pin from the labes. (Konrad,
  dtbs_check)
- Link to v5: https://lore.kernel.org/r/20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz

Changes in v5:
- Added function-enumarator to flash LEDs. (Sashiko)
- Dropped l22a regulator needed only for NFOV actuator. (Sashiko)
- Dropped vdda-csi[0-2]-supply, as it was unused. (Sashiko).
- Added previously omited cam_mclk2_sleep sleep state.
- Link to v4: https://lore.kernel.org/r/20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz

Changes in v4:
- Use 24 MHz ext clock for the cameras, as the downstream does, since
  the upstream driver can now support it.
- Added additional LED, as the phone contains two separately controlled
  white LEDs flash (upper and bottom, in one module).
- Increase flash-max-microamp, as I took wrong "flash" from the
  downstream sources and dropped Dmitry R-b.
- Address formatting issues. (Konrad)
- Link to v3: https://lore.kernel.org/r/20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz

Changes in v3:
- Dropped cam_vio label. (Dmitry)
- Move the MCLK2 pinctrl from cameras to common camss. (Dmitry)
- Link to v2: https://lore.kernel.org/r/20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz

Changes in v2:
- leds.h include escaped the initial submission. Fixed.
- Link to v1: https://lore.kernel.org/r/20260411-pixel3-camera-v1-0-2757606515b6@ixit.cz

---
David Heidelberg (2):
      arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras
      arm64: dts: qcom: sdm845-google: Enable PMI8998 camera flash LEDs

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 199 ++++++++++++++++++++-
 1 file changed, 198 insertions(+), 1 deletion(-)
---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260315-pixel3-camera-a9989bf589ee
prerequisite-change-id: 20260608-kbingham-orientation-20afc0fb6957:v3
prerequisite-patch-id: 4ca069e5db821444cc3555a6ec3939c89dfaf233
prerequisite-patch-id: aa559ddd6f34d32f6f250e02086d1b2b932a2688
prerequisite-patch-id: c45901f8d919eb99a5bf282a1c89f5aa7c36cc52
prerequisite-patch-id: b2c8278c88db9d929453b8153f3e698cbf0053f9
prerequisite-patch-id: 3ce9cd5eab9a04b3b1f7d796a67b4c2cce903e1c
prerequisite-patch-id: 68e98a7f998b731d8c5520620e48b63dc839cf25
prerequisite-patch-id: 2b7d638e54d82ca3689ac06272440137e67f1656

Best regards,
-- 
David Heidelberg <david@ixit.cz>


