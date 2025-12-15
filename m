Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235FB3358B0;
	Mon, 15 Dec 2025 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765799262; cv=none; b=hF4NkgEuXCYPiyXO+AC/gBiKVhC+6tlH34TeskPLdQyZe0+w26mXq5Q+j3u8/Y9gkderAhjndS0vQMqJP8kwOukoVI71/N7E/EibyW2YYwBq3stoAheWCM3XAI/bDJjSOqbZHaS31h+P1/oubYQOjEuufcgO6z9QzngQnhiO+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765799262; c=relaxed/simple;
	bh=Tw2PAVErhvPJTWX4i5SviB238yZnY2udyEHylGYsDrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FwWTBreyYdj/nNtYDTCkttrJ511idbSjGNsV2D5PwxFTi7v8jYDKbHjDMuEz/aHdR/wxjj8bi/xM7FmDZfrTFYnqTUPz2js8ux4jutOszzERdYXX4KRG5LAVLQ1nXZjkAoVXVW3EVtW4F3vto6eFZEcO/7PHUAXgxVEEWfSbmtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0s8PwH+o; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0s8PwH+o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=qChWII7YU0dPGLuhGx6Hi0lLzxxkedT+0cFWcFxavFw=; b=0s8PwH+oYvtcbINmpprf+s+aF/
	ET2F7leFesp+2r4coEj3JIW7NhD17zLVhJnZ4Pc71HnOjQmv1R4Ir+yTNJK+iBbk3U0SCgx/81Hn/
	WWx6L+N6f6UwLjDHPjZR0E1Wj4ZQoz+qKXwGCroTfOZMWsFOc0yq7YBNpBhST3h8HDv6gxcYPJZJk
	/UQgrJcHwJ08ACoHBcIQL/p8sbSSNfJLmt2nQiFtnzT3vjJfysShvFsH0+jhLXnbA0L102LYFFbRv
	6nK8UwS5imdNlvNqiiD7QH7kGpZzvrX+bIePchMh9hChgik8v/Cx77O59FNJW8tpIPfRURtNzyz7X
	wSkOIevg==;
Received: from [192.76.154.237] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV73A-0000On-Er; Mon, 15 Dec 2025 12:47:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Martijn Braam <martijn@brixit.nl>,
	=?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
	Pavel Machek <pavel@ucw.cz>,
	"Leonardo G. Trombetta" <lgtrombetta@gmx.com>
Subject: Re: (subset) [PATCH v5 0/4] Upstreaming Pinephone Pro Patches
Date: Mon, 15 Dec 2025 12:47:32 +0100
Message-ID: <176579924023.1404176.12391640220645132527.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
References: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Nov 2025 19:46:59 -0800, Rudraksha Gupta wrote:
> Throughout the years, many have contributed to the Pinephone Pro (ppp)
> development. Unfortunately, these patches are scattered around various
> repositories in different states.
> 
> I will be attempting to upstream these patches. I will start off with the
> following small series:
> - Add light/proximity sensor support
>   - Link: https://codeberg.org/megi/linux/commit/f171bc7013bc7ad3de9af817bfbcbfa548ebe01c
> - Add accelerometer sensor support
>   - Link: https://codeberg.org/megi/linux/commit/b0bb7633e073a6760fa213b8c4a78ea2e73c7bf1
> - Add magnetometer sensor support
>   - Link: https://codeberg.org/megi/linux/commit/2f7e67f451f16eaf15b81aa1dbdf126d54927d35
> - Add mount-matrix for magnetometer
>   - Link: https://codeberg.org/megi/linux/commit/d7cd2eab931e32fa94408a96d73b4e6c0616107a
> - Fix voltage threshold for volume down key
>   - Link: https://codeberg.org/megi/linux/commit/7c496a5cc27ed4e38b740f36c2d8b2c62f80ae54
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: rockchip: Add accelerometer sensor to Pinephone Pro
      commit: abd9bb7ad5bdbbf76316013cda3812c2719a0210
[4/4] arm64: dts: rockchip: Fix voltage threshold for volume keys for Pinephone Pro
      commit: 5497ffe305b2ea31ae62d4a311d7cabfb671f54a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
