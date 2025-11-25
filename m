Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F5513AD26;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764042421; cv=none; b=X5w1ZzBVVtVRYF0CPGSrhsWcKNe00NT6TLPaOZ9W6DYNArUG9ZK/FPTfIpsWCHuWktn2P/H8DGUKt2zDVtCEm9oA7FNSDG+gQ4z+sAkJGTjP/JX2Cg1kOs6o8s6sZ19hNImTG98g117YzuaGEwkFUwYzmnF/6LQ37x+weOw6NFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764042421; c=relaxed/simple;
	bh=JdG4DaI/Qc50V4Qsb7hZVw07NZj9J6447kSQIzMX7LQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZjNs8TIuVmjSx2QqIM0hSsryg6qI4h3MWRrfj/BwITHZY9PU0wDXR3ygf468WkvSz4eVukLoIRYy2aiQvJH5O5gqgzcl5/Z5KlN2gBQL7ZRdbHU05aN+If9lWzO/poCXZxUtTw2K36LHEdDtXY5bx3sM50WimKuBSi7z4gu6oxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgYIdVsz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgYIdVsz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 395CFC4CEF1;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764042421;
	bh=JdG4DaI/Qc50V4Qsb7hZVw07NZj9J6447kSQIzMX7LQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WgYIdVszWFydSTrJDHB1qSrFtPaXPxGQHKZ3Wkm3dLWJbnKxU1irJR03TBNJSgOoL
	 DX9D7rOM8BCzAbGvK8ATOf2l4tHg4E+gWdEN/NGrSFYmGrfvqJP0arUHjJGw9Cml/h
	 18TqXDMyUu+cMUQmYv89e0I9O4f0XmyFkEAE8cqVf1d23FHZTgQ7eEmg7XXMdVoRWp
	 jXJKduD7mEZqwYkqoE6NhKSA060ibpydC89mVQ5MmwGjmIQEzDPgeRF5TGqvIRNqaO
	 vnJ4k7P2UNR1KvuBKJhASvAVvQlX05Sc+ZsvVowF4o0XFXN2E+pLtIhHnMUwyjuYPK
	 skswhxMop1r6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCCFCFD370;
	Tue, 25 Nov 2025 03:47:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v5 0/4] Upstreaming Pinephone Pro Patches
Date: Mon, 24 Nov 2025 19:46:59 -0800
Message-Id: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALMmJWkC/5XOTW6DMBCG4atEXtcVNv4jq9yjipAZj8ESYASRm
 yri7jWsULNIunxn8XzzIAvOARdyPj3IjCksIY455MeJQGfHFmlwuQkvuCwqXtBpmuo+tN2ttgD
 Y14Nt6xR76uL3SA3TYIR3Fo0jmZhm9OG+81/X3F1YbnH+2dcS265vwonRgoJpGnAlcqzEpR1s6
 D8hDmSDEz9i7AXGM4aqAVBgtbD4Fyv/g5UZ09YrJZnXGp8+E0eseoGJjClZGc+5K4VkR2xd11+
 3DErTrwEAAA==
X-Change-ID: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>, 
 Pavel Machek <pavel@ucw.cz>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764042420; l=2902;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=JdG4DaI/Qc50V4Qsb7hZVw07NZj9J6447kSQIzMX7LQ=;
 b=ZVOBijytHHRZBAkav8KWxiESEsv4+3UqIouLDZVFE2LIPpDfdAhc9Gqwbh7exYG6mEgs3D4Zr
 9z0WFy8uQt0AFRgQKfktoGJInOqrXCWooH5fYvL9K3zLa6DJYldPJB2
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

Throughout the years, many have contributed to the Pinephone Pro (ppp)
development. Unfortunately, these patches are scattered around various
repositories in different states.

I will be attempting to upstream these patches. I will start off with the
following small series:
- Add light/proximity sensor support
  - Link: https://codeberg.org/megi/linux/commit/f171bc7013bc7ad3de9af817bfbcbfa548ebe01c
- Add accelerometer sensor support
  - Link: https://codeberg.org/megi/linux/commit/b0bb7633e073a6760fa213b8c4a78ea2e73c7bf1
- Add magnetometer sensor support
  - Link: https://codeberg.org/megi/linux/commit/2f7e67f451f16eaf15b81aa1dbdf126d54927d35
- Add mount-matrix for magnetometer
  - Link: https://codeberg.org/megi/linux/commit/d7cd2eab931e32fa94408a96d73b4e6c0616107a
- Fix voltage threshold for volume down key
  - Link: https://codeberg.org/megi/linux/commit/7c496a5cc27ed4e38b740f36c2d8b2c62f80ae54

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v5:
- use monitor-sensor to verify accelerometer's mount-matrix, lux, proximity
- use Leonardo's compass add to verify the compass's mount matrix
- Link to v4: https://lore.kernel.org/r/20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com

Changes in v4:
- remove leda-supply and vdd-supply from dts to suppress warning
- credit Martijn and Kamil for the light sensor and accelerometer patches
  - Link: https://fosstodon.org/@martijnbraam/115272859701389599
  - Link: https://codeberg.org/megi/linux/commit/fc5660685ebe4ecf60226bfa27a1ce47c1c1d020
- combine the magnetometer related patches
- corrected accelerometer's mount matrix to Documentation/devicetree/bindings/iio/mount-matrix.txt
- filled out commit messages
- rebased onto v6.17
- Link to v3: https://lore.kernel.org/r/20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com

Changes in v3:
- change magnetometer mount matrix
- update volume button threshold
- Link to v2: https://lore.kernel.org/r/20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com

Changes in v2:
- remove usb-typec node in dts from light/proximity sensor patch
- Link to v1: https://lore.kernel.org/r/20250920-ppp_light_accel_mag_vol-down-v1-0-c8bbcd3e2e94@gmail.com

---
Ondrej Jirman (4):
      arm64: dts: rockchip: Add light/proximity sensor to Pinephone Pro
      arm64: dts: rockchip: Add accelerometer sensor to Pinephone Pro
      arm64: dts: rockchip: Add magnetometer sensor to Pinephone Pro
      arm64: dts: rockchip: Fix voltage threshold for volume keys for Pinephone Pro

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 41 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)
---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


