Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB501DFDE
	for <phone-devel@vger.kernel.org>; Sat,  8 Aug 2026 00:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786147774; cv=none; b=aT9CwBXkk4Ssp3/06Uw/3Oh4NYvgvstmqUJCYliGSnVKFJvzsx1WJx1nNCJAShP1PNmmoMkevx+T9WYuMDxRW6DmX3POab3AErWKRwKyw8D0C0PzyzAoJjEB6+qtSWA3TpE7LZZ3+c7fuRnj6BcAKMsuRfeZrTFsR0+cwP9AXXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786147774; c=relaxed/simple;
	bh=lDRaQu6/9wkhlDCv2yTHfkldEo5fvukdaDSbjb18JJE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIfU2xezF9iQlOkucLan/1cP8dISc8gFnsgmhQIOp3XkRk8hTdaW6Vt1tx/e2xOOZkJNkCYpdKKg3yW0BDiuMkOb/aDyl0nZfO+4PnkFr8FFxFukJvhe9ToAJ7eZuZvRWxL3t/O6DAGZsZ2hywSOPFV9F0PA6spUwMRIVIlQOSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=H0Midps+; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="H0Midps+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786147764; x=1786406964;
	bh=lDRaQu6/9wkhlDCv2yTHfkldEo5fvukdaDSbjb18JJE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H0Midps+lnpM9dRKAzZs8LO8dpNxkBv/G9YcUw0UkuZN/5JCwuC8erTfZRGrIw/zN
	 oTReXtNmVQKNncv6ZY6MBoXdCECZ/gC+a/g4UWmzLPa/Q6haSPqm+5dbbUMYKQMqzn
	 Sj/Jn6DdVr1j+OS25MljK+RJA+wnLYbtT291XFBHcAhZI7TcBT56vgJhnXGflGBSZ3
	 8c6Fz2KQEw7FD1HmHJyLk9FlqPrYIJ8iQQS7Ld7ImgZfDh1E/OFzr7TEJy3KrS5tNL
	 la0xbLjQuPYFpEvt9nD5W9fj5dyfCjrr7dUiuHscI+3AAKwQ3Ka5HqozecSRuiShVk
	 aadVyZFjCN5qQ==
Date: Sat, 08 Aug 2026 00:09:16 +0000
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
Message-ID: <32cfbf72-f2a9-4919-aedb-49f76a400362@proton.me>
In-Reply-To: <20260711-sm8450-qol-qmp-v2-2-d14353bd6ff4@proton.me>
References: <20260711-sm8450-qol-qmp-v2-0-d14353bd6ff4@proton.me> <20260711-sm8450-qol-qmp-v2-2-d14353bd6ff4@proton.me>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 650ffaff1a53d7802a9dba88bf6b3af193d76c97
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/11/26 11:13 PM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
>=20
> There are no downstream device trees that specify five values in the
> qcom,aux-cfg1-settings array.
> Plus, after cross referencing both downstream device trees and entries
> which refer this function, only 0x13 is specified.
> Since 0x13 is written at initialization time, drop this function as a
> whole, and remove now unused variable assignations.
>=20
> Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>

Could this commit in question please be picked as a subset of this
patch?
This commit should have been picked along with [1] since
calibrate_dp_phy is not present in it because of this very commit.

Regards,
Esteban

[1] https://lore.kernel.org/linux-arm-msm/178603357411.674490.1152033940734=
0817802.b4-ty@kernel.org/T/#t

