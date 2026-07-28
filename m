Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C795A48EBEE;
	Wed, 29 Jul 2026 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331959; cv=none; b=qSqiVgpaKXyUpfLWfjb15sZrGnjyG1IOtKNWc62RlLvv9NsuJZt4vRDacf6UN2MitnyP6p57B9umqSa+6HIu0xt1lDq118DZiG2sXrWL4Ra38zDOSjw9ho0IJuryb59V4WAroUexEitZuxyshlrpxpC79cZ8Bmr7b25fRdJfGO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331959; c=relaxed/simple;
	bh=2bOlnEK/aWI/Jb2787J4E+Yl33+iZ/BphZlElqt8CGU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iYcVACkCbaQura8k8kgGL+vM0RH32NdlG6JcHgC9PmQLD8XeEah2KIXBBgfYylCPcxkiOP3pP9UKPkvYQgOVOcIXqh5GsiGs0BLhem7IAQsjxq9vjJ6tPa8EkaHfd3XODss60pQHsZeR085fk2mzSOtUZtvNIFTOFD3np56+qck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9mS7GMa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9mS7GMa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDDC1F00A3A;
	Wed, 29 Jul 2026 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331949;
	bh=0m0B4ZG7R4PKkaGdSaVDhBm4lGp6CL8zFKs2WWwouJs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Z9mS7GMaNxusJqcE212yG8OYQw0xhCVNNAhpBqL3OMD90ycJwj0fbR1xobVsNVSX7
	 OMZ8y8nCA8Bwj2udXLRGLngU1cgJqyjpiMWlyXEqFK5rBdHCjSo9A13C79FhtKehbw
	 iHxklxdLZxp6gouCfuRMjMgr9elsD5gRs0tE5BJTHv/PaDXjJKTltcK5ckZo+k+g77
	 AQaFXeUqMBmUxtgtFUH3mDLLGECE6jBQ49c1AH8EICtx+Jxp4CN+3F7QDk+1nDEDou
	 pO8HwtCdiDdfgGQhy5mmCJefe0FEJBPKGbWcbYHTyAz+8b4Q0M+yw8FrBRm/SGbZHB
	 HpGJSFRWuaKNg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Esteban Urrutia <esteuwu@proton.me>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org
In-Reply-To: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
References: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
Subject: Re: [PATCH 0/2] PM8350B LDO support
Message-Id: <178526496705.318884.7445289320806261696.b4-ty@b4>
Date: Tue, 28 Jul 2026 19:56:07 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2bOlnEK/aWI/Jb2787J4E+Yl33+iZ/BphZlElqt8CGU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqagDpU/hC5pRnNgZFMZLLW/TP99fSrQXSGFV/0
 k+45xZqm2KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamoA6QAKCRAk1otyXVSH
 0IQfB/9kzPKoGr4/zc9C+unGxpXTz9wWwxwIpdeqmI23daNvbJqLSwU1NSyrXzLZt8Abiqm423t
 5MRagcmDV2ZSqk44MaHAp6NxYegWLmn+y5P4FtJixvUbT4GXKzOZIszBopdowLGRineswR5iXtG
 d+R9QddOSIUrMiCxRRwOAmb7BxaYuu/+1Ie5ID1F9sEu8ce6EyqIzNGY007uS/DwLb/P/3KSDbb
 ZSKz5GfyDnkCXhVmHCTPqtlr1q3i+bzpJwcE5eaOmA0675nJiqvKPcDgbXxirvtycFxBDVwRcRM
 rsyBbNoYKwvss0WIe5ZCBxMzPgJMpPN8QuWu1uOLMj/5mzsC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Jul 2026 10:53:51 -0400, Esteban Urrutia wrote:
> PM8350B LDO support
> 
> The PM8350B PMIC has an LDO regulator which seems to be mostly used for
> powering display driver ICs.
> On my device's schematics, vdd-l1-supply is represented as VIN_DDIC, and
> vdd-l1 is represented as VREG_DDIC.
> Downstream this LDO is of type pmic5-ldo and I assume it should be of
> type pmic5_nldo upstream, since this is the type of regulator with the
> least margin error for the reference voltage, which is 1250-1296mV for
> my device.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/2] regulator: dt-bindings: qcom,rpmh: Add support for PM8350B
      https://git.kernel.org/broonie/regulator/c/90b5df5bf0a1
[2/2] regulator: qcom-rpmh: Add support for PM8350B
      https://git.kernel.org/broonie/regulator/c/6753251cfc96

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

