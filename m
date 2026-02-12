Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFC0F4F1;
	Thu, 12 Feb 2026 16:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770914085; cv=none; b=ru9qGaHLE/Ihxoi57QefU35VjCCaWxqgAdh3DWnbMDWxivotKe+p1YY8yANxHDsIAQW6vVvtBnr3JnjsJhc17G/AxyTLjo1JiS6SSXu54qipze3vpefQT+0iPxJ23QsC66HHak4DeepPWBbsx99Sjd4g4boNNjthlqTiOt8TMFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770914085; c=relaxed/simple;
	bh=UBdePPv19uaL81ASanxtUzA/Qh7h0X8+eypdZNRQKxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o7oGEzB/zJSsc3j+1XmW28uzcXQZldOmimM5W5KE5Bu8NHTdsLrO8SH5KVhHGJJDfJw/rV8/2ykfVNCQW9+xghtMnfKZ01cp25MTRHYjVcAiNjNA7lgl7auD9owpPKxcA3rtP+IK1su9odCXHS3nQ7jdlTIEBg6h/AwSxY2opJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJRzyLLO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJRzyLLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4196C16AAE;
	Thu, 12 Feb 2026 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770914085;
	bh=UBdePPv19uaL81ASanxtUzA/Qh7h0X8+eypdZNRQKxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aJRzyLLO7S++VcEmPsUMM0/hxmMSZstPvayj0Cq/wUdlzHoPKgviRFDgGBCXEsZo7
	 nzyW/yDTmLtyTa6W5uC4hIGGiItga+w0BV/hR09cKF/rQOVa2reO/Kh5I09KgT2np/
	 9XzuCiIVqWG3NLvpDktTpWqUnRRZIhfU2cXhyVJfNEm3xW+sCqA57WVXZEtthP1BEE
	 aVNkrrORqeisEgdYIkl8u1anz7XJ4QQCXUhGQJV2ZfV1tXVvDaSk4G71vam9WCtVWv
	 tyKx8UjXzv7Y6GsOQqcu9lXCYcKt7DOYgBZ+boZRRrnXVruEaiXSUvsaZYGOtR5uJK
	 fBGzTjurPBUcg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Weidong Wang <wangweidong.a@awinic.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
References: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
Subject: Re: (subset) [PATCH 0/3] Bitmask logic fix and firmware-name
 support for AW88261 amplifier driver
Message-Id: <177091408247.278884.5191633104631780418.b4-ty@kernel.org>
Date: Thu, 12 Feb 2026 16:34:42 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 11 Feb 2026 11:27:31 +0100, Luca Weiss wrote:
> First a patch which fixes a logic error in the aw88261 driver. And then
> we add "firmware-name" support for that driver to support loading
> the device-specific firmware properly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: aw88261: Fix erroneous bitmask logic in Awinic init
      commit: b82fa9b0c26eeb2fde6017f7de2c3c544484efef

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

