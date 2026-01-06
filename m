Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A70354AE0;
	Tue,  6 Jan 2026 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724935; cv=none; b=rJg8H161/E15/J5WHV9/hvzI/G0s0jROwzxbTXtlm2js21Va+s0FIcuVeAxyDqv0bUWXs9H+JRdjPDhP+3fLRHA4iGpvcUFPYzfMG7asCxWqymjmvUp9M80Q3PJ4+usRQZF1ID8mjCfKLXO7p70glFOVXFXvy8GDyk2tCJMn7U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724935; c=relaxed/simple;
	bh=IZJSKgEbNi1RsSOG/0ndHi0Nwd7YEhIuXT0g7eL/APQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YaC3aBNHS5Uy3c2N1jQ3NJ7bj37pU9/Lu3SAYKf5OBITkrsITyqsiFe+GUr3VF90rTPR/Q+c8rtysCvTtN8DsaFVE3NKVz3A+lNxXn5t4cvtzzEmaE9zZSfzv75aI8zDgr7+izs5wizlbU9UOh1fBzdnaPLS+iEkW0rHHzX+NPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JRsFOcWC; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JRsFOcWC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Eq0CqoMxGePRdfmtZq04yvid4QxViZV6z4QHN+0Dl7E=; b=JRsFOcWCmtPqSgsEcxqmLuPnBE
	8Ev6MrkfuUr2Y4Ns67l0eSsB0qrLnUeCxiX2f4PhPzbVVEyEaE3hzACd220AdcTLbdwqJudKeIiUL
	5MG6EM5KrwlSkNk/Pm/JCjHB6xz+YSvcZE3cUk1dho93K6S12VztK0V/R/rxeB10hKpuTrZjMPSPq
	FjJYthoJAM2Naqqw0pJZqSSTGIaVk5mz3ECqeSZa6l7Y8Gk4wrmAHWIXv0Aakp1vCR4QVBqt+L4NY
	NDfxLgdNJe21fzWyhF2A5hJp5HOl5vkKvzRudBLT3OxlnRu+YlAr3+eqFTeHMMMKIPiiJPQf68X3d
	5hrjh08A==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdC0N-001Hfs-CZ; Tue, 06 Jan 2026 19:42:07 +0100
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
	"Leonardo G. Trombetta" <lgtrombetta@gmx.com>,
	Pavel Machek <pavel@ucw.cz>,
	Martijn Braam <martijn@brixit.nl>,
	=?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>
Subject: Re: [PATCH v6 0/2] Upstreaming Pinephone Pro Patches
Date: Tue,  6 Jan 2026 19:41:58 +0100
Message-ID: <176772487191.3029798.15593519528724659699.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
References: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Dec 2025 19:43:18 -0800, Rudraksha Gupta wrote:
> Throughout the years, many have contributed to the Pinephone Pro (ppp)
> development. Unfortunately, these patches are scattered around various
> repositories in different states.
> 
> I will be attempting to upstream these patches. I will start off with the
> following small series:
> - Add light/proximity sensor support
>   - Link: https://codeberg.org/megi/linux/commit/f171bc7013bc7ad3de9af817bfbcbfa548ebe01c
> - Add magnetometer sensor support
>   - Link: https://codeberg.org/megi/linux/commit/2f7e67f451f16eaf15b81aa1dbdf126d54927d35
> - Add mount-matrix for magnetometer
>   - Link: https://codeberg.org/megi/linux/commit/d7cd2eab931e32fa94408a96d73b4e6c0616107a
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add magnetometer sensor to Pinephone Pro
      commit: 2b8cd99c8cf489d539e1347adb5fd39548c53f19
[2/2] arm64: dts: rockchip: Add light/proximity sensor to Pinephone Pro
      commit: a3e4bb6c9a2262c87a842d9fa42bdd65a1671edf

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
