Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB813E9284;
	Mon, 20 Jul 2026 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544791; cv=none; b=Cq5/aik/pPckVSAXsWjsLf/CUyUgdB2GBMlUHuesxDs7JY/0OXj+nYzQB54MD0bz8gizY02hsd+paIL2AB0K/0fSR6F5aCtXHMo4HVWHFmIS446RkPFBYILkS2MYpRP85NSJH/A4g7lvANVJNbvRSh03CZ9TsfcJKbRs8ihIW2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544791; c=relaxed/simple;
	bh=VasTktyFUPD4AQ67HvndhYwaYe8DvrCH9EdAcPC1AgA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i9PzRH3yLytE0+WKIUJIwR9GbjWgowOfDSxmzaTkkvfFrFNrpMuCwGclHUekKe0Ocn+o2mu6cCiTf0xrWV7sNNf+NEcwpBwY8SuxnqsK+tuNO6teZ55XJfiRDKOUgi3VxMeH0b6ysxGT919XQee8reGdVZ5erfjETmauYgLmgS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ucRl/5Sj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ucRl/5Sj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A951C2BCF7;
	Mon, 20 Jul 2026 10:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784544790;
	bh=VasTktyFUPD4AQ67HvndhYwaYe8DvrCH9EdAcPC1AgA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ucRl/5SjDxvcJgMMU+bMhzaWoywdoV6WUoG1LZR1Wnaq0k0yh5HT+T6DlftmO7iUH
	 767jYPYCDGW1DhCwv//Med5+9W079Oy0DR58kHYdAhN9NGYZwBBr0tKbsACeL5YTBU
	 dHu2gd/YiH5BZ14VUbp7TzKSVxBxMKxFH511QR/G78hQEa2KAAvFCCACeJyDCDHUTu
	 D9K98z0sGbjG8v1Gr7PjLHC6l128sRosfNJ9AmOWE5Z6p1mewxds3PWuQJuBq3Wdrl
	 umCAZMlMIKALW/TdxtqPeQIIqINa4ojXd3YW7vW9nuy0UQ/8gsI1cCQKoBeAqihz/d
	 dG1FucN2ATLxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E687C44527;
	Mon, 20 Jul 2026 10:53:10 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v6 0/2] Add initial dual front camera and rear flash
 support for Pixel 3 / 3 XL
Date: Mon, 20 Jul 2026 12:53:06 +0200
Message-Id: <20260720-pixel3-camera-v6-0-afe419bef476@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABL+XWoC/33RTW7CMBAF4Ksgr2vk8V88rHqPqgvbTMASBeqkE
 S3K3TuBSiVZsHyWv2dr5io6qoU6sVldRaWhdOV05OBfViLv43FHsmw5C620VwacPJcLHYzM8YN
 qlBExYGpdQCLB5lyp5QtT39s7533p+lP9vtUPMJ3emyzAomkAqaRuXOOVd+CSfy2X0q/zj5h6B
 v3UarYWUggYUwKb59Y8Wr20hi1pnxSq6AHU3Np/2wAurZ3eDTkm0MYHp+fWPbWOLaJD00LaBnr
 483gfZKXPL95H/zfNcfwFZu7wHK0BAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2265; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=VasTktyFUPD4AQ67HvndhYwaYe8DvrCH9EdAcPC1AgA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqXf4UDUWDOdgWx6PNlM3XUJZOPS7xYKnbdBWYX
 LZ96zbDACyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCal3+FAAKCRBgAj/E00kg
 clDPD/44MWNF3PQ2J4iZeUDzIb378/RMLNTBtDkRvGCge8wMJJ+DnO2UlHS+zQJk8iCAQpcD4IG
 hVPAfYFl5hhO6PyKwxxK+r7tZ2fct5c2Zwbns2Jc59OfQU2SDoCCOCu1x8EfkM/6Q64amsneBNr
 oaff+oP/SbEIl7+R32Z8kLDqhX289+yRuD1zkUXG32OcjDqzCbo7TYhELp3s8rgftBsjS+SMQxa
 UCkDV8C5axKXm0NhJaCeZA6BqtumYjeDRHGRspUruDk0mGztaOGxG22RR/1+7dgaWIV4GkwK44F
 ZViTJCLf1nQJBP2N1k/QyQ0gO5zX2ZAGdA2kB9dZTvP8loutdfMfw8k4Up9SAUYslAiI7XmEDlx
 y3fHvUxnoW7HFW+go71iGuWmP872GDieeDQJw1HU8WwZskjTcMy014iQpZjHRgPRc1C+7Yc+EDH
 h1kG05jgcJqmFRsYYmb+XRzvOvLkV8R6Ge5aOB+jYtVsFfa22V/L0h7z4dSrqq4bMkvwISk8xMK
 064RAbk9/VomKNENsM1yoYeshz+3a4oTiaozgl4gi+ioC20SqasFtKDPRpbr/PApt0ZdylHz8/2
 Tm2a+qxpeD61ie7T6fIVA5b12+g4Aru9OeIIk4+QNbIKFV5D+7QfKAbN7uVu3tHj4CDagNjRKUj
 TLb4TNLwCqGA8SQ==
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

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 198 ++++++++++++++++++++-
 1 file changed, 197 insertions(+), 1 deletion(-)
---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260315-pixel3-camera-a9989bf589ee

Best regards,
-- 
David Heidelberg <david@ixit.cz>


