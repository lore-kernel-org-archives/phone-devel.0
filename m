Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4693F077C;
	Wed,  1 Jul 2026 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903774; cv=none; b=bRLE7G+Tur0gI0HRJ/Y7Ro2JgSXj0m/nrB4EyC1fMgrpUpLNK9JO8+6ItLUaKKiqTOV7+sUw/L580U9YWpgWZ05glYaPBbUp77M31yPHdTFDgKmVOFPdhVb6g6GUSmKXUE1JSsWfV3U2JPQ6YGrsl5VMDySe3AXZtzVOFZ+4mP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903774; c=relaxed/simple;
	bh=NQhTOH7lbS22lqnZrsXUeoym6lJDp0e+hYPviGfdbvM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AUO7NSOvOFzUCfKBZbfj4mK06bm7Gr1U9NkEVNvSt2iWwsw/8YwbGxEYw45KF20b5Q4J5IcGfNU2yGDgmvzB3El4viQ4nP0XPZYSFmd32Tpb6o+P8fGb0uMc4zWHzb4ID7yJQEfWWmxtBDtqrl4aGl42iDEa0knTusr7TqhrHmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVN92ySH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVN92ySH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2821F000E9;
	Wed,  1 Jul 2026 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903772;
	bh=9vUHsAg9pHC1O7gXCUAYGBB5kTl+vq03cakkfnwM53s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WVN92ySHyfzvL75b//qrAfhwt7Qlioi0mb+PAguWj/6T/wBFDaacsGLk0q++viysd
	 VCk4hQCUz0B/e5FabPlrdJ6lmadxYkQY8x48fRd3lTnCMlj834ygvxBKK6jbd6jmRH
	 I9ehFbVqCcmrQGZgk6fIgSCYUVE4dFXLJs2M6HmxVDqch4jANqfR4JxjzqCcLNnuv8
	 coC5v7WNLOT1EGSiCVzZkJgD6DDX/KLZV6Z9U3nmCIdj+8CKvPh5/+YY/ty9DxBUNN
	 ynapR5dT/jL4ZAl5/toY+RUV7o8MRFn2hmTAC/jy3m6T2MaOnnYcETZWNeJbJSP4hQ
	 pxf7BOqB12tsQ==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com, 
 Bjorn Helgaas <bhelgaas@google.com>, David Heidelberg <david@ixit.cz>
Cc: David Rhodes <drhodes@opensource.cirrus.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Rhodes <David.Rhodes@cirrus.com>
In-Reply-To: <20260624-dt-cirrus-cs35l36-v3-1-ec451d5a2908@ixit.cz>
References: <20260624-dt-cirrus-cs35l36-v3-1-ec451d5a2908@ixit.cz>
Subject: Re: [PATCH v3] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT
 schema
Message-Id: <178284521305.368110.12236626138017371767.b4-ty@b4>
Date: Tue, 30 Jun 2026 19:46:53 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NQhTOH7lbS22lqnZrsXUeoym6lJDp0e+hYPviGfdbvM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqRPPYH6cLjC3o/TM6h/i25kDWgoXC9C9yNFpec
 csCGChOIqOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakTz2AAKCRAk1otyXVSH
 0Em9B/47mZmiZdgWsDglKabwgp6ZTCbgVxGNlVo3K5MZ3oC3SaAobaEHvGByFTIUoAmonoBEwnI
 kZ/B8TH8LTTTrn5DnbHNgzuwIZku2HwI0m9lGmQ6fqNR3Wob77fa6OhzdulYrEeAbvyVjvzvivM
 dI8/0cPwJLeFhGUaoyowgyimar5W4+kw2DF+PiuPUODPRt8GOB6di/iBDW3lSzUiamN16MJW//l
 jKB8wqlFWWRWRJPaxXLZivMewvPbUszjRF7sEKabqi2kbm7vmGyulQs0zDNJPHpi6nytNwU+aGl
 LwY5GwjaNSDqs1WkyZO3YHXrTQV3qvhl5QZDVjl5+qUjFvra
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 24 Jun 2026 23:10:02 +0200, David Heidelberg wrote:
> ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema
      https://git.kernel.org/broonie/sound/c/bff7fad1010e

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

