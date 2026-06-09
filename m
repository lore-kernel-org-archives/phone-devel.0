Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFCE3EEAD7;
	Wed, 10 Jun 2026 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087003; cv=none; b=iNNOJYjFKnP4rDO7PkkywsWUZbDdHhUciwTaW2tnugS/QpcsSYjsT99K28JBTujjKyQo+w+f3on6+JaP1H7BHvK/BTXs3Dg3m8kw89T77+FBKVGCpmrwdzrRHBfNAfVF/goRQ+unAHb1EZbtd9LO9QNlKcRxfz32naW5w/2LINo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087003; c=relaxed/simple;
	bh=PAGrDWie8BTjOTXvkdxU5Th2jdyJTQTL0HQ17ZCgp/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oZHPOrdHrAnWlsZK1ePG4P5u3iQMRNQqg0QThliTE1VU5rjKkkvMHT7X06XrrYW4AsMX/VkfOihpMGYnXQGi7Yom+/+74Cs/G/vnzQh5hwAz4766gCGLl5DT98/0D1SJFk/ZN3MmfxQZpFp3D+14s0c6O6xTB+yWY/2Zl1t8P68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOyDLLm2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOyDLLm2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4241F1F00893;
	Wed, 10 Jun 2026 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781087000;
	bh=OqZNRywFsffFbpu4Dq0wPVF6iIEwNLobhUTVzvlf4WI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HOyDLLm2buh0DmGG6QKbovtle4kLYWoRvwZwR2n3h9t50D0tu/OPHmmWlV7IcKwg5
	 VqTB2oQtpsOfrQOnlpjU20b/jXqzohuFrsc5iTVz23lt/ADmQHwLs5GNz+NFi9MxeW
	 +5eiagZRtaUU9alHmlvAEL29/FN3epkC8xcj9c5ytwCOBRduiHvLbBzbwFJa4E4T+g
	 7BnXc2uRZKwokXluTNKhhSMxkxMyqUebid+nkyizXYZ8zAzOMDe5B8xywCFh2CJTvh
	 rh7IDDvV4JV9O3tVsFqiAVXu6ARjcBJqZVKaI5p/1RvRto1gbykYqodOxjSdQVXCl4
	 nRu96pGvN5tLg==
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260529200550.529719-1-val@packett.cool>
References: <20260529200550.529719-1-val@packett.cool>
Subject: Re: [PATCH v3 0/7] ASoC: codecs: aw88261: fixes and cleanup
Message-Id: <178104655633.212106.619790244001573816.b4-ty@b4>
Date: Wed, 10 Jun 2026 00:09:16 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PAGrDWie8BTjOTXvkdxU5Th2jdyJTQTL0HQ17ZCgp/A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKTsVPgOjpl7YiKpIJ71gTUUNl2wKyV2oiiuZU
 H08CgNFw1iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaik7FQAKCRAk1otyXVSH
 0EkrB/0SjT5YYiceWwSZTaykZ5Nle2EQLCi/oTE8+lKjZmejgneQOZ5fWNEZ3CfDCbqYLVDkYbS
 +stLIp0LxJecUaF3WChuLT2EOq+ecCC2EjwkqqDj8TsO0UeqjRg/lAKBPf/CViIzpoPHEkzyQYi
 +NsH56uK8NgWJZloTr+anql/psi4QHwqwPWwpwNkrmvcmLrOP8x9N/L7XcgbSMRszu0TmE15et4
 5A4rGC9SM94LjSWZuX0wwg/EsyYUdG0cjG9tM5PI6hYRCRCD/k2ZAewNC0Lzum13imTMoMjDgcy
 EA7lozTVkxrHIFNFF3re3dvRu5ts/0DscF94QgUe21P2vzgE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 29 May 2026 17:05:07 -0300, Val Packett wrote:
> ASoC: codecs: aw88261: fixes and cleanup
> 
> The Awinic smart speaker/amp drivers were merged in a very
> "downstream-brained" state, where configuration was only really
> determined by the binary "firmware" (register list) file instead
> of properly participating in the ASoC system. Let's start
> untangling this mess. This series makes aw88261 actually usable
> on devices like fairphone-fp5, motorola-dubai and xiaomi-pipa.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/7] ASoC: codecs: aw88261: support changing sample rate and bit width
      https://git.kernel.org/broonie/sound/c/1b92b0673d5e
[2/7] ASoC: codecs: aw88261: add TDM support
      https://git.kernel.org/broonie/sound/c/33f917e18f39
[3/7] ASoC: codecs: aw88261: reduce log spam
      https://git.kernel.org/broonie/sound/c/d90c361af215
[4/7] ASoC: codecs: aw88261: remove fade in/out on start/stop
      https://git.kernel.org/broonie/sound/c/edf01bc1c698
[5/7] ASoC: codecs: aw88261: remove async start
      https://git.kernel.org/broonie/sound/c/caea99ac809d
[6/7] ASoC: codecs: aw88261: fix incorrect masks for boost regs
      https://git.kernel.org/broonie/sound/c/79c053a1ff9d
[7/7] ASoC: codecs: aw88261: make volume control usable
      https://git.kernel.org/broonie/sound/c/9b2929eed4d2

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

