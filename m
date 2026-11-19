Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175976;
	b=3C16bvIjKJA8TGXjwBI4hQcr8Hon7XJGMMI5VHuVVNjVfysFVtuQgGIOzo2SYsPz6VsV
	 opT5N7gZbbn5XHaH00qJR6gAQVoSult5ScRKbG7L2pwqPCx69cZZGX8DPjYiS7AQ97yVi
	 s5DN1lAV9MfY7KBGNWrRodyL6TJAAhRNRWhsGjuEF9wesxUcjcSoEiTaUMPvltdbHAs35
	 Zwt0QFHzIBNT2ko0+yeoYjXOZgK26ARCI06IYdFiOQBYJ3mHmc1NgoSUmJwMb6DAi5XC+
	 J5iKQoRuqlXikQnIEgtnvX8R3ksu6obpfPiibKbaUwU1e0UZlHSiz8YnwS2tc1QfYQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175976;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xGxazQdGcUKBZXkNT3EgqWjvCMXu7XolU++fRMgk5y0=;
	b=M3vKImimbtfQ4ilUHeA+RFlBke980Fp7ZTBSz6miqNQNHRAI4XJ7b4ooTC8yKNcppQjO
	 j0+ZBWsfll9u1R6xE6uurZNEbLOfsU5KC1vfe5tlciRt1BEYX3MwaFgU4q+VppSf7eym+
	 ZN3NfsLfLoHoBje2pEOCco0F2malRWWtshf5J+/SP7BwedVcCf5mPa14uoaOVh3DeICKi
	 c34FEQrur1S8AVc6gFcQZCdnzMyVP4EDjXqLajU6nOK/xV946ITBVE/wqMwKqPr0vSqwl
	 P2MXrX366rg3yVtjtOL4ZktpsG2U1p8YwZd+JWmJEEJ5H+U2O2c4TnankRvbnpBmrrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="awtN/n7E";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E8606A320;
	Fri, 20 Nov 2026 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=awtN/n7E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0298E1F000C0;
	Fri, 20 Nov 2026 11:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175976;
	bh=xGxazQdGcUKBZXkNT3EgqWjvCMXu7XolU++fRMgk5y0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=awtN/n7EFRKtcaMFVRTe755O03sEMUEz9QS0FUgwtoGQ4hjvwu8GEwa1eWWxODuhz
	 TVjV2k05IZiC4SzHcoqhdD7emzpbhNkGiMSkVKy+LOdfwonBISRWTeplhdySWAmCms
	 r20GekNPcQyX2bI0VX/rq1DsWfvaMA/DyOp1rIGA7DWK4Itp4EX6Jx5/WaMmdJ5zok
	 J4TxEnlPtWMC9/HYLOhGPDR1T7tZPlOIL9b7aY05hne3wPKZx/hA1eSFQZ/EVZMjMF
	 0o5VFj+CLztVrzpekjEM5G/1pt82mgw4lwo+bMWbtki3tuHKeq8jPAbL2xRDs2eOpt
	 75SMNIqmprT6w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: linux-sound@vger.kernel.org, phone-devel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119-vantage-tfa9865-v3-0-5257fa45df57@yahoo.com>
References: <20261119-vantage-tfa9865-v3-0-5257fa45df57@yahoo.com>
Subject: Re: [PATCH v3 0/2] ASoC: Add the NXP TFA9865 amplifier
Message-Id: <179511065502.116416.9667231227994890644.b4-ty@b4>
Date: Thu, 19 Nov 2026 17:50:55 +0000
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/0PVE2m1OploXZpaI7B48bfggYZo0YPomATOhhLoCqc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZzFTOlzaUXWZcJxCk+757QwejupWMVPghy0Pcz6X1p
 /AKXfvbUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIlIczP8D0vamONyQsjYzleq
 zdX5ubtBnIrinHWnxGQftR+bMeuiAMM/C9t75b1qs+LYb+yUKlDRCrgjLWZs95rdfs1Uo6v3RNx
 4AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 14:01:45 +0530, Venkat Yadlapati wrote:
> ASoC: Add the NXP TFA9865 amplifier
> 
> The Motorola Signature has two NXP (now Goodix) TFA9865 mono class-D
> speaker amplifiers. This series adds the devicetree binding and a driver.
> 
> The chip has no DSP and a different register map than the TFA989x parts
> of tfa989x.c. The driver applies the initialization sequence for the
> device revision, selects the I2S slot feeding the amplifier and powers
> the amplifier and its boost converter up and down. The register settings
> come from the NXP tfa98xx driver. Only the B0 revision and the 32-bit I2S
> slots configured at reset are supported for now.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: dt-bindings: Add NXP TFA9865 amplifier
      https://git.kernel.org/broonie/sound/c/3bb77766ce46
[2/2] ASoC: codecs: Add NXP TFA9865 amplifier driver
      https://git.kernel.org/broonie/sound/c/ba47599b523e

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

