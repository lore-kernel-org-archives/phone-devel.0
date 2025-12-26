Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE7419CD03;
	Fri, 26 Dec 2025 03:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766720656; cv=none; b=pR+L6DDP0hUOPF7VWoSzHQqJsR8+M03nqV9yXZQxMRzsI9ozmckDisaz7X19WjDNDvugGy8mOMtma67aE0pCToWSjeYi3tGKZsIR/qVT62Z8VAXnx+bF621csILyUTSKVUpGTUTKZNqpf4vhovywqhfnqFGIyr5YTC2weKp/h3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766720656; c=relaxed/simple;
	bh=Ou87PO0R/OWNEEu0ns8K1kPWQXC2moP4qrOtG3wy9A4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tCnaeBvBidfBwuntxhsAfLHNth9y4pRLPgHHBvDlVsOtNin7I9i21CZ+R05hR/Sx8NMVBnrLP3jzV6k99gnoEGjfmII3HPlJHn9ZUF9y1jICCvpKuKlWqyqq79PRaEJ+NyI2d3K/fTSf5Wuj+wMYoBp7rzqcsJYy2zIQH5RzXdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkmsebiB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkmsebiB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02C01C113D0;
	Fri, 26 Dec 2025 03:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766720656;
	bh=Ou87PO0R/OWNEEu0ns8K1kPWQXC2moP4qrOtG3wy9A4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JkmsebiB6tMRQYMmXq3NVYB38HVoHVnwpUkosPj956QFLfUdG6RdmfWe9Qxl2v8hB
	 VpPWqAHkWfv8DZqbibVmloL36GeHUljL0zqFvBWOkBkSN97SDtN9IDhmT9cfAZtG9A
	 8677Q6yOJSGJheM9vZHZKbh2+t0f+LMyrMtle7LjRE+NhJbWAMtAa5eTMWRoTXWHjm
	 saA9RvAu/C/qLgKwHo5ShhP1KT9YWHGldXOslqhWGNF6wko6sxoDrtvfd87dyVQanO
	 sIIaKi5L7oMUpg2x80aF338vYk5X+fdG8D3kTcqY23R/Aqrj6dtz6gWZvl809ABTCR
	 hbpB4Hdz8FRYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB1FE776C0;
	Fri, 26 Dec 2025 03:44:15 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v6 0/2] Upstreaming Pinephone Pro Patches
Date: Thu, 25 Dec 2025 19:43:18 -0800
Message-Id: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYETmkC/5XOTW6DMBCG4atEXteVbfxHV71HFaHBHoMlwAgiN
 1XE3etkUaF0Qbt8Z/F8cyMrLhFX8na6kQVzXGOaSuiXE3E9TB3S6EsTwYRitWB0nudmiF1/acA
 5HJoRuiangfr0OVHLjbMyeEDrSSHmBUO8PviPc+k+rpe0fD3WMr9f/whnThl1tm2dr1BgLd+7E
 eLw6tJI7nAWe4wfYKJgqFvntAMjAZ+x6j9YVTADQWvFgzH46zO5x+oDTBZMq9oGIXwlFX/G1A/
 GuZAHmCpYqIEzYKAYtnts27Zv3tJQ4fwBAAA=
X-Change-ID: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Ondrej Jirman <megi@xff.cz>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>, 
 Pavel Machek <pavel@ucw.cz>, Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766720655; l=3050;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=Ou87PO0R/OWNEEu0ns8K1kPWQXC2moP4qrOtG3wy9A4=;
 b=NXdEf3OwQcE6VqJFKTxbvswHHnjmSS571lQw4+wcJjV7dCkSrwcycAfoIy/SeSYs2l/L/RQHz
 UIJaYULe4ggBZNaMuVIc+OofOTaJ3ywvj5163p+kmRPRtxgWsCzU5VE
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
- Add magnetometer sensor support
  - Link: https://codeberg.org/megi/linux/commit/2f7e67f451f16eaf15b81aa1dbdf126d54927d35
- Add mount-matrix for magnetometer
  - Link: https://codeberg.org/megi/linux/commit/d7cd2eab931e32fa94408a96d73b4e6c0616107a

Already upstreamed:
- Add accelerometer sensor support
  - Link: https://codeberg.org/megi/linux/commit/b0bb7633e073a6760fa213b8c4a78ea2e73c7bf1
- Fix voltage threshold for volume down key
  - Link: https://codeberg.org/megi/linux/commit/7c496a5cc27ed4e38b740f36c2d8b2c62f80ae54

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v6:
- rebased to 6.18
- sorted nodes alphabetically in compass and light/proximity
- added pinctrl to compass
- dropped accelerometer and volume patches as they are merged
- Link to v5: https://lore.kernel.org/r/20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com

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
Ondrej Jirman (2):
      arm64: dts: rockchip: Add magnetometer sensor to Pinephone Pro
      arm64: dts: rockchip: Add light/proximity sensor to Pinephone Pro

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20250920-ppp_light_accel_mag_vol-down-817c84fdae8d

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


