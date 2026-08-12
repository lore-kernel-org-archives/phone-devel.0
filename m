Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7AB7E0FF;
	Wed, 12 Aug 2026 05:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786512658; cv=none; b=IpfaV8VLZpTf/1zbwe2MNgmBlO+40UUW8yL48YaZ5XfiS+zI6oukiutyuMQ2QUlM8waWh2JUOhX/F14puDjs+gCb5mGuhEUKllLlY+t/2faTztNWxEF+iL1xABSSGJvfYdiRhOyomufKn65IeFyxRFfC97Tb+yZAoOCbRAYp6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786512658; c=relaxed/simple;
	bh=sYSNIip2E+ZzKXf+3SOxvlO2hA4wQ66mjV2sBjNEMew=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f9y4R/6Ow862RamCLys9vOeGSDUY17lgzn8rlp/or2wnms0/rV8O4cIIqYNFNkBhjBkipgeua/BdfXgmzlgfMc1sucDZRovUMc6h44lK/Se8HyAC8ox+ofQsnzza/gDWYrh5r1aVvwkagFBOdXqvVs3KR0UDUUCo+ebwdSI8Rcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=A/Bpk8hJ; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="A/Bpk8hJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786512652; x=1786771852;
	bh=cDb456A7Rh8/A4xScT47anRNvF/F2Z3GKnWmku+/TJU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=A/Bpk8hJAVtj5Xn8XXMx1BczhDU61ZREtgLSKKTGsdMnGPzkVqrU9YF3wfcOc5Prd
	 0S5uBPnlJRmPKWGvU6eIDPSnUEYb07ywZ0WDgWidAHSFTtXddQXT6k1DN1aUHVKdXg
	 B7TDScJGdB3KUYBHTjS7F/+gKiLP5906aiwGVcwU+ae5RSrtAQPr+3Xh7wyq3W2asQ
	 e0vh5NeFdkVCLrgaPUBFbhcUGX7jS/lE+YvW11ErfQKas0L6Q3vFpIYfD4NDWIAg6N
	 RSpiZdI6hxkbgS9zmRDJeyoiiZ0dj4Z91nlihf3Nz7DgFtkMWwGmjT/fajVQ0d8BlK
	 Ba9HuH1hhlHww==
Date: Wed, 12 Aug 2026 05:30:46 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Parade PS5169 redriver bindings
Message-ID: <5b70bc25-a255-4059-b020-da936e7432d5@proton.me>
In-Reply-To: <20260811-watchful-turaco-of-opportunity-b8ddbf@quoll>
References: <20260810-ps5169-bup-v3-0-a2178b2834d7@proton.me> <20260810-ps5169-bup-v3-1-a2178b2834d7@proton.me> <20260811-watchful-turaco-of-opportunity-b8ddbf@quoll>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 892a72c4b529568aba990045be936b788949c6a5
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/11/26 5:11 AM, Krzysztof Kozlowski wrote:
> On Mon, Aug 10, 2026 at 11:31:36PM -0400, Esteban Urrutia wrote:
>=20
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree=
/bindings/submitting-patches.rst#L23

Okay, will change that.

>> +
>> +  parade,dp-eq-db:
>> +    description:
>> +      Equalization for DP channels.
>> +      For example, <6 5> denotes an equalization of 6.5 dB.
>> +    oneOf:
>> +      - items:
>> +          - enum: [ 2, 8, 10 ]
>> +          - const: 0
>> +      - items:
>> +          - enum: [ 5, 6, 7, 8, 9 ]
>> +          - const: 5
>=20
> Eh, this is on me. I did not pay attention that values are fractional.
> You should not be a list, but expressed as a single value, which is not
> possible with int32. This might be the only ever practical use of mB :),
> but I doubt that any engineer would find that readable, so let's go to
> your previous code - direct register values - for all three properties.

-db$ specifies an int32-array type so it should allow for a list.
So I'm not certain what you mean.

> Sorry for the mess.

What I ended up with in here does indeed looks messy, so no worries.

>> +
>> +  parade,usb-rx-eq-db:
>> +    description:
>> +      Equalization for USB receive channels.
>> +      For example, <5 2> denotes an equalization of 5.2 dB.
>> +    oneOf:
>> +      - items:
>> +          - enum: [ 5, 11 ]
>> +          - const: 2
>> +      - items:
>> +          - enum: [ 6, 7, 8 ]
>> +          - const: 0
>> +      - items:
>> +          - const: 8
>> +          - const: 8
>> +      - items:
>> +          - const: 9
>> +          - const: 6
>> +      - items:
>> +          - const: 10
>> +          - const: 4
>> +
>> +  parade,usb-tx-eq-db:
>> +    description:
>> +      Equalization for USB transmit channels.
>> +      For example, <6 5> denotes an equalization of 6.5 dB.
>> +    oneOf:
>> +      - items:
>> +          - enum: [ 2, 8, 10 ]
>> +          - const: 0
>> +      - items:
>> +          - enum: [ 5, 6, 7, 8, 9 ]
>> +          - const: 5
>=20
> Best regards,
> Krzysztof
>=20


