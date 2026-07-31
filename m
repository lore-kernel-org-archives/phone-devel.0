Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AFA451999;
	Fri, 31 Jul 2026 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516076; cv=none; b=J+qH3V6IvcvWLOx4Gc4QdshqjojgfaP7qJuMQCY5jo2MaKvFL76MyV3nrspBSMsm3pl5YXD+r5TlkiVJNYUtFfsCm3iiDdNpGf1NWqE6lC9ZlhiHD1tjegKPhkthp+2A588PAcXilDzYqyB6Z+h/U5rOqefrJt22y7EhUfGlt2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516076; c=relaxed/simple;
	bh=fQWT4wQ+tPH+nUwhJFZpI82T4FocCSDu4zSo4LpkarM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tB9ITGRRwxJMY/uHMOJ876IPGTKkPgskxVBcVCAPdBzTCu3JxL8ZiHKZAXG0lX4EQtmOdki4TafDz9U+KZkrMuZ4VeCgFWyFROoCrtdVu1bZ6kYJ/FYSPsRMj6M3ksPxBrbagAvcpaV7w4Ozxw4RidxgI8hLnyiwRimSGYaJLDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ZNOVTeOM; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZNOVTeOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=qih6ar3fxbernjpkjufk7ffplu.protonmail; t=1785516064; x=1785775264;
	bh=fQWT4wQ+tPH+nUwhJFZpI82T4FocCSDu4zSo4LpkarM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZNOVTeOM7G/uHb/Q7+g7UQXVga22jqickek6pw2vYi4/fiMWO83w91RCCHA8Q6kRZ
	 9uvbJrcP72c2UD9TpdzeWcnl8uJFqZvBEL85P+cxkAWJbUcZTVKptK/q3dEzPG2cS0
	 Wwjasn2N/4swE/Ej+Ba3LfJztTVOlXG1L2qtgt8u/sKNuehxWFOBj2+6E6OpSUBiel
	 10AvShbaOXaTkAiQBEymXghXQooMm6is6y3u6FxdCCKE1dHbi3jEwvc6XvBWs9t8MH
	 LlMG/QPvljFpK2Vvi5hRvAjlAFRdl9rUT8INmzETbDaTyCQhNKgXcuRmwIhyvtedYN
	 xaRQA3EQHeJaA==
Date: Fri, 31 Jul 2026 16:40:58 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
Message-ID: <f3324409-8e07-478b-a0e3-da5b41d31e7c@proton.me>
In-Reply-To: <2ace2703-79cb-4046-a2b3-8fdeb9b2c99e@oss.qualcomm.com>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me> <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me> <20260731-savvy-piquant-chowchow-f516f2@quoll> <9718d7b8-7303-47a2-9d75-58bbde6385e9@proton.me> <c4ceda32-d4c8-4fd9-b0d6-3f4519485bde@oss.qualcomm.com> <6fc5165c-95b5-475a-a0a6-e1d7b9721222@proton.me> <2ace2703-79cb-4046-a2b3-8fdeb9b2c99e@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: e5070080d1a68ba6d5edd313b8cb2541cf38cab7
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/31/26 12:28 PM, Konrad Dybcio wrote:
> Somehow I confabulated the generic compatible being present in the
> driver... I was trying to explain that
>=20
> And yes I didn't notice the 8350/8450 difference. But anyway, the
> resolution will be one of:
>=20
> // 8450 is fully compatible
> "qcom,sm8475-pmic-glink",
> "qcom,sm8450-pmic-glink",
> "qcom,pmic-glink"
>=20
> or
>=20
> // 8475 is special
> "qcom,sm8475-pmic-glink",
> "qcom,pmic-glink"
>=20
> depending on what you believe is more correct. I think the first
> one fits better.

Yes, I agree the first case fits better, but I believe there is also a
possible third case:

// 8550 is fully compatible
"qcom,sm8475-pmic-glink",
"qcom,sm8550-pmic-glink",
"qcom,pmic-glink"

The reason why I believe this is that I've found SM8475 to include some
elements such as eUSB or PHY sequences found in more recent SoCs such as
SM8550.
I guess that's the case since SM8475 is a respin, but I'm not sure.

Regards,
Esteban

