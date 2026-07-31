Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C34A435EF3;
	Fri, 31 Jul 2026 15:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513281; cv=none; b=ugtZsWPB6ZmF6343wDVnMgmCjpU7XzFgeRWPDBLrCmb3xzo568pMK3NA2AmHP9HCtqinKTRg49LqiKqiTn3hh9GYK91ti1Nbutgv/AJQnKHxS15eAsmjiFu6Y5yT8BhMw7toWhTE7atyN1bvKt8P6GyOo2TYi3c4FxovGCgFIS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513281; c=relaxed/simple;
	bh=UvfV0yUydnPwbeXd1gmp8nhkgykO2QTTcFOpW4UCBq4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rsiycc5O0DLSUHmGHZP9ZKW8tjlYd23ul2or0iHdD2wAZMvupK1iclI6eoy7s08LA4c67req02sMiBi7HZ6Fuu/7HElqNqpR8rWUAHbjJD0HbTXajEDbsQB/xLR8ADGACjNXimkYv7w8HEOnCZ1qqla659qXCt/e7XzKHWyJp/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=QKNy54Rr; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="QKNy54Rr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785513272; x=1785772472;
	bh=UvfV0yUydnPwbeXd1gmp8nhkgykO2QTTcFOpW4UCBq4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QKNy54Rra4MP+uigkoKWhjwWJwUA7GrAp0sVQNKjQl+cmyvuwaDTDlbL9jxHftcIR
	 tgro5h2bmt2S7Jc8vHHYzwlRV8+9DNKy7GU4AdyOae+wsjL2RMU/w6DAf62wc/DuNK
	 b86wm+nxwtsTc8tCLG/4nIwfJokUe7c7J4wM27JHImCAbuoeHh2QRm1FDig/cJQzcZ
	 8ElbBmmkgC/c3BhC9PiYCuh+z+Gg+2knyK/oHyO4zFMVXO1kuRQCZ/dFvUiGbH0lrs
	 rM1n3480XYCasQxHz/WU96l3ZNC1xbPh4CZs2U8zvbDQo8/sp3K/bgEBTsEpZHli8Y
	 aZZ6sw0o7Gbtw==
Date: Fri, 31 Jul 2026 15:54:25 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
Message-ID: <6fc5165c-95b5-475a-a0a6-e1d7b9721222@proton.me>
In-Reply-To: <c4ceda32-d4c8-4fd9-b0d6-3f4519485bde@oss.qualcomm.com>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me> <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me> <20260731-savvy-piquant-chowchow-f516f2@quoll> <9718d7b8-7303-47a2-9d75-58bbde6385e9@proton.me> <c4ceda32-d4c8-4fd9-b0d6-3f4519485bde@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 62dd8eb4d952bf400f0cb957436432499d2d0d32
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/31/26 11:30 AM, Konrad Dybcio wrote:
> On 7/31/26 4:44 PM, Esteban Urrutia wrote:
>> On 7/31/26 5:58 AM, Krzysztof Kozlowski wrote:
>>> On Fri, Jul 31, 2026 at 01:00:08AM -0400, Esteban Urrutia wrote:
>>>> Due to a different process design, SM8475 (4 nm) SoC takes things from=
 both
>>>> SM8450 (4 LPX) and SM8550 (4 nm) SoCs.
>>>
>>> What things? This is just unspecific and not useful. And I doubt that i=
t
>>> is even "different process design", because how one would know that?
>>
>>
>> The process design is specified on the corresponding datasheets for
>> these SoCs, which are flying somewhere around the internet.
>> Also [1].
>>
>>>> Add a separate compatible string for this SoC to avoid possible confus=
ions.
>>>
>>> No, explain the hardware compatibility.
>>>
>>> Add foo bar, which is not compatible with baz because it uses bam bam i=
n
>>> different setup (difference in registers, e.g. XYZ and ABC),
>>
>> How does this commit message based on what was said in [1] sound to you?
>=20
> That made more sense because the electrical differences are what made
> the PHY init sequence changes necessary. Here, Krzysztof is trying to
> express that the pmic-glink interface found on SM8475 is likely no
> different than the one found on SM8450 (and SM8350 and so on)
>=20
> Then, since it's the same, it can reuse the same driver match data,
> so patch 2 is unnecessary, since the driver binds said match data
> on the fallback "qcom,pmic-glink" compatible


I don't understand. You're implying that the pmic-glink interface found
on SM8350 and SM8450 is not that different but they both have different
quirks on ucsi_glink.c.
No quirks would be applied on SM8475 if patch 2 is not in place either.

Regards,
Esteban


