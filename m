Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF841D555
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318065; cv=none; b=PKrimkdGG/hpozZX3rtRjpVdbU4TWLNe5C4YNt7RZYbNQXE4b0VxRVN1ZqDEpdDHdDbX6gOsGJYawO1h/5sOi/NE1d+4RMTpKKLyGOFeRoxUXIdnDE6e5Tkg+7xEOJmkTA1zEiN0beKupPZ9VibHOOAzIupcwb7Gx/UlUrz8NIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318065; c=relaxed/simple;
	bh=0Z461eCoWmeeLRSzx2zG6LMHAnSV72wwXSXO4J8KBg0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GiDOBWV7IlaQzsBBxzSdqeXE7Lg5vOQ9QZBtjcnvM/wXHd4smuMEJg5nBvG5xPDufHfP20Nv6L1igfcJpXaS98Wwq7CJQh2FOV7XoShsLDdSTqNOrDgYi62zXBvvPwUuIwG/m2qDcG9l1Q8meYPh/VD0JNN2ZjGlJpZyY56kVew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=DJM+i7yI; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="DJM+i7yI"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vBvgJxo6Fc4k/F2We7JWv4pPctNCqkWz+bWg7yw/L3o=;
	b=DJM+i7yIyzv9w9fGnUqFjT9Jt/Gj3hH8Z52YnA9m69ObnvdRJs0m2LuVVdjJu+45vhMQ2p
	JAwVslOxfiBNAnOol4NqZa5Gc1V/hQGDGQLMHe4dbLG7gIlXuPIyRlwrUueE7z5bEEw5C8
	FGcAgeLjqVsycg2xAgcH5HNyvP/3R59OiO9y+okY39jOOiznuUsF8PR2AgQNMwPZbz1gGl
	qqvjPUHkK3zoBiCD+ZPCMu2rfefC4A+NKcOEWiLTNgbE5NtA05M2NuoUY6zy1UVn4K2wlT
	LXrW6FfnRYCpZE/DMp/XTOmzDIA6NNHY3S/NpJtlYW4KZTONGQXvkjvJsgnfLw==
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v6 00/15] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
Date: Mon, 23 Mar 2026 19:06:30 -0700
Message-Id: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQTU7DMBAF4KtUXmM0/k1SIcQ9EAvbGbeGNgl2G
 lFVuTsmLZAIsnwzmk9PcyEJY8BEtpsLiTiEFNomB323IW5vmh3SUOdMOHAFFWP09VSfDw2t+0R
 Z4SRDVdUOPMkHXUQfPibs+eWaI76fstlfh+SIKZnJ3G4ebiR8k51p8EAHRhktuXKFlCCstU9dm
 /qjiW/Yt+m+jbtH8oXvQ+rbeJ6KD2zSb6CYd8wcUC6stEVRQe3wDzdpA58LeiHwLChkGjVwLYx
 fEcRM4OVCEFmwTDpfYWXyckWQPwJjXC0EmQWjjAYFYLkuVgT1K3BY/kFloQTHvHemlOV/wjiOn
 /gGTe0QAgAA
X-Change-ID: 20250911-judyln-dts-17c41e59dc0f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Amir Dahan <system64fumo@protonmail.com>, Pavel Machek <pavel@ucw.cz>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=4790;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=0Z461eCoWmeeLRSzx2zG6LMHAnSV72wwXSXO4J8KBg0=;
 b=QYgyRHjVm8rj/sLJ3mQfUiL3wNW8My6Ko7Izm4T6GwSg19K3zF4YcGJ6zdQvqiXotbdakWe9I
 OLrZ/CHE37UAjRxv3FMnTGW+fryClt4m39zjZlG2QbZyBgjrtLDyTod
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Rollup of improved hardware support via devicetree for LG G7 ThinQ
(judyln) from sdm845-mainline kernel fork

Notably, this patch-series enables full DRM acceleration and wifi,
among other small improvements in individual commits

after this patch-series the main things that remain to be worked
on include touchscreen, audio, and modem.

Depends upon panel driver patch-series https://lore.kernel.org/all/20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org/T/#r9a976ca01e309b6c03100e984a26a0ffc2fe2002

Co-developed-by: Amir Dahan <system64fumo@tuta.io>
Co-developed-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Amir Dahan <system64fumo@tuta.io>
Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v6:
- Mistakes were made with b4 and branch was rebuilt, hopefully correctly
- Split more things that got mixed into the sort commit (qups and venus)
- Added more backlight properties from downstream
- Framebuffer added back in
- Update compatible for panel
- Add qcom,te-source
- Reference memory region in framebuffer instead of reg
- Correction to rmtfs_mem
- Set lab/ibb to 5.5V
- Fixed flashlight/torch
- Update commit message for gsi-loader=self
- Update LG to capitalized in firmware paths
- Remove qcom,snoc-host-cap-skip-quirk dependency (break wifi)
- Enable dma controllers
- Link to v5: https://lore.kernel.org/r/20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org

Changes in v5:
- update system64's email
- reduce lab/ibb voltage range
- status should go last
- remove rebase leftovers
- fix flashlight
- Link to v4: https://lore.kernel.org/r/20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org

Changes in v4:
- add panel identifier in addition to ddic
- make sde_te pull-down
- fixup flash current
- remove framebuffer reserved-mem
- remove manual lower guard
- depend upon https://lore.kernel.org/all/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz/T
- reword commits
- Link to v3: https://lore.kernel.org/r/20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org

Changes in v3:
- change firmware paths to lowercase 'lg' (matching dt-bindings)
- fix signoffs
- add wifi dmesg to commit message
- remove regulator-always-on from ibb
- remove framebuffer
- remove msm ids
- don't continue commit subject into commit messages
- split bluetooth node
- add sbu uart details to commit message
- change ipa gsi-loader to self
- Link to v2: https://lore.kernel.org/r/20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org

Changes in v2:
- sort at the start
- drop unnecessary labels
- drop unnecessary gmu
- multi-led
- split fb-panel changes
- expand upon firmware commit message
- use qcom,calibration-variant instead of
  qcom,ath10k-calibration-variant
- change firmware paths to include "LG"
- remove framebuffer reservation
- add lab/ibb

- Link to v1: https://lore.kernel.org/r/20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org

---
Amir Dahan (1):
      arm64: dts: qcom: sdm845-lg-common: Add LEDs

Christopher Brown (1):
      arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger

Paul Sajna (13):
      arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
      arm64: dts: qcom: sdm845-lg-common: Enable venus
      arm64: dts: qcom: sdm845-lg-common: Enable qups
      arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
      arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
      arm64: dts: qcom: sdm845-lg-judyln: Add display panel
      arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
      arm64: dts: qcom: sdm845-lg-{common, judyln}: Add wifi node
      arm64: dts: qcom: sdm845-lg-common: Add chassis-type
      arm64: dts: qcom: sdm845-lg-common: Add camera flash
      arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self'
      arm64: dts: qcom: sdm845-lg-{judyln, judyp}: reference memory region in fb
      arm64: dts: qcom: sdm845-lg-commmon: enable dma controllers

 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 228 +++++++++++++++++++------
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 129 +++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   |   2 +-
 3 files changed, 295 insertions(+), 64 deletions(-)
---
base-commit: 674feabdc26e80c4dbc884d7b6e2d2a4b93919e6
change-id: 20250911-judyln-dts-17c41e59dc0f
prerequisite-message-id: <20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org>
prerequisite-patch-id: e51151ea7f8fdad6ad7d90713febc5c6b6fc4f9c
prerequisite-patch-id: b3dd44250da9cd12bc5b2d0d7e865dbe19ceed92
prerequisite-patch-id: fd6c8077806cb03fcf37d0e0d730314c2760e334

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

