Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A90411F89
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740954; cv=none; b=b4uYanlYFECEnWLLSraNTRyasmgAM2DyyR+e+kpaMttYw1k8QF2ggoUBtiZNxL24B84wWrF5FZlqi9qs7gjYXJcysH3da4tqEbu9yAwOLTMO/7MQtf9HDDhPHC8l+TeGwFl3YGJaXU3gizlUc1i2pA/PKSaSUL/7Bw38Ebbp2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740954; c=relaxed/simple;
	bh=otgE4BlDNttJLSTdSkPcjBDLB10Ko4Z57qMN5bI2t8E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNWpR+a9R56AMHqmaN49fAA0llFc5EvcoK4YhLdWimm398LJ9wbF4ch5U9VtciCiat/awbKzzSRBG3nQlFnKEcS6tnr4DSB/aZnHKqhSQmqsNuXeteHhW3Xp04YhvvK0hMQCe53/u35U3HC9nncUblRZ4/zGSrHY9goOvDV1T5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=AeBW49hS; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="AeBW49hS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784740946; x=1785000146;
	bh=otgE4BlDNttJLSTdSkPcjBDLB10Ko4Z57qMN5bI2t8E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AeBW49hSY5qGGQqGex6CdqUBshJCM96AbFDjgqv7QjSEAQq+DQ2guXEhJCnY7TYhL
	 N2tzv7VOxsl9lctvo5I9CthgbBmZDPnfNW+aoATPO6dR08hRrIK9Omcw11kif3KbQo
	 7aTpNqu/ohps0Sord60LyhJjnLaA+XGBUqspIh1B+62NTFWunDaI248n2mYtW3/w+8
	 gdL5q3XqkXgU+x82Pn0eVT3hMfm2zs/zwHVTqaKoGAKvppkzx3qyKJK70Jy/3CxSle
	 1GhgPlRtTxe+SHcGPslqZWg+fjPvFHTh9zyUaHwLW4IagRml/+vsEKP6JVnlfRVU/U
	 0syE9VepyRD+A==
Date: Wed, 22 Jul 2026 17:22:21 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
Message-ID: <56b9c83e-e90b-4b95-acff-d0a232069fe0@proton.me>
In-Reply-To: <20260711-sm8450-qol-qmp-v2-1-d14353bd6ff4@proton.me>
References: <20260711-sm8450-qol-qmp-v2-0-d14353bd6ff4@proton.me> <20260711-sm8450-qol-qmp-v2-1-d14353bd6ff4@proton.me>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 23e43a487f912dc5619a457c760ffd98f8aeb263
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/11/26 11:13 PM, Esteban Urrutia via B4 Relay wrote:
> Comparing sm8350 and sm8450 tables, this seems to be a typo.
>=20
> Fixes: ef14aff107bd ("phy: qcom: com-qmp-combo: add SM8350 & SM8450 suppo=
rt")
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
+Dmitry, is there any update on this?
A confirmation on the tables was requested by Konrad almost a month ago
in v1 [1].
I asked for an update two weeks after, to which Konrad also requested an
update in v1 [2].
Please confirm the correct tables for SM8350/SM8450 so that this commit
can be handled accordingly.

Regards,
Esteban

[1] https://lore.kernel.org/all/4635a665-f605-4647-810d-c9d83a271a86@oss.qu=
alcomm.com/
[2] https://lore.kernel.org/all/7cfbc3dc-c1c7-4e4d-afe4-67a25084f607@oss.qu=
alcomm.com/

