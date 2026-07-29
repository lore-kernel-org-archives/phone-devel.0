Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B22381E8D
	for <phone-devel@vger.kernel.org>; Wed, 29 Jul 2026 02:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785293088; cv=none; b=M2I9DeN+rzYHXtxDR+8Ju/v2NQHqlTYvGYJedYOjD2liCGV3jIVzzd3PcEC/IQXUCJPvw2QQmK6LOz9dAE14nw6vLGWeeG6GdF7nyxFzk4VapVgp3/Q86DiAwH7Cx/0FPDzadzxuuK3dizT/HtudMMQZNOZnDUkizDe6pctFBs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785293088; c=relaxed/simple;
	bh=H1jEBpulhwXcxkrQhaY5mwLrLyjgFnxDDci3QGQk6Ns=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nNSzddF/ZIa0PMkq/bxvdiev1dcpc5Z3Or3YWoSj6NWhLu/QelcU9x0QBhp9lcGTfGcFOSPcabTClcQpO9rHIO7S5b/zgRtdKLH4UhC2VIfl1iUM/qD4mvGsUFkb2/W+/enXYUAkc/WkHUrFdt70a6tp+891zwAqbvLkOPbEuzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=efTlB+p/; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="efTlB+p/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785293074; x=1785552274;
	bh=H1jEBpulhwXcxkrQhaY5mwLrLyjgFnxDDci3QGQk6Ns=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=efTlB+p/08TxaRCZdpi05SY1v5hRaHlAfSRnqZFMqVwQvTrz7ejH71yIsJ+y3IgFs
	 8qc5j7pxertNjU9Ky5ajpugjeF0Wg1wP1L7gmcTXTl5cZboBGeNwxoOfULF7r0FHxL
	 776vwiwK3YOTk5sDuOJ7aIiYyiNR6umJD1WXTupq4p48kHidgBqvXYUcVq8ikwCzlL
	 Em/sIjUE1cf+6Y5R8I5BodikipGFTZbv26mN1GWaSt8rFZMReaISW4WHtyr3zF4ZsR
	 mNnBferqVdvs4YJck9YeUFAgDBpOM76bxnfru0dmAbJoUswMIhH+H2kQ1mHqJxf6iX
	 RB4rbKUlN/++A==
Date: Wed, 29 Jul 2026 02:44:27 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: qcom: alpha-pll: Check Lucid Ole PLL status before configuring
Message-ID: <1c4ff5d7-58dd-42c1-882c-c1ce0d5a62cb@proton.me>
In-Reply-To: <40404aa6-7822-4c65-abdf-0ecf1fa073cc@oss.qualcomm.com>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me> <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me> <40404aa6-7822-4c65-abdf-0ecf1fa073cc@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 72e22563e9944f6a8e79f33c9bd846bf4313b83e
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/15/26 5:31 AM, Konrad Dybcio wrote:
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Konrad, since you pointed me in the right direction for this commit, can
I have your permission to add Suggested-by?
I should have asked this earlier. Sorry about that.

Regards,
Esteban

