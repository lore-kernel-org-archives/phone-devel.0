Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006BE3D668F;
	Fri,  5 Jun 2026 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671176; cv=none; b=PpaXogERD5cSSUcOAVDSUBAOYrl5lrSKItMy8bSrYidpgTdCxlgtMHyTs8GqCbsLbUp8wy6qNW1bJlsNq39SfF5gIxLGjZJ5GhzSFcTbeuk6sJU6LOCCxT4DXA2Aru0egr3oLgAgU9xygsNw4xAnI5ZtZhdW/HemaOl8BGiuHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671176; c=relaxed/simple;
	bh=nQfDg2cAMFcvMVUxNquY59qh0L6Dc689yPLLlWQkl+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ph74Huox6O+N/fp3kExk8E+di0N6fmHJgkiNaZ6V712Ts6JjgK3wTVWAoOLATF0sEce/T3mMWwnRbab09LzkjnE90Siv2XMNBHFiKmjHtdJIyMMmb4UkyVY/PKeg7EqJbLjh6DngfKgOwcVJR4AjvQzRWh0inZcvwj2PnYie0Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b=pLa7z7v3; arc=none smtp.client-ip=77.75.76.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="pLa7z7v3"
Received: from email.seznam.cz
	by smtpc-mxd-85fb448c55-l247v
	(smtpc-mxd-85fb448c55-l247v [2a02:598:96:8a00::1200:706])
	id 09c79de452c9c98d086e51ba;
	Fri, 05 Jun 2026 16:50:15 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=szn1;
	t=1780671015; bh=nQfDg2cAMFcvMVUxNquY59qh0L6Dc689yPLLlWQkl+I=;
	h=Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:Content-Type:Content-Transfer-Encoding;
	b=pLa7z7v3soMAQhW/LRwANtgNNhKoyl7yR+UNJXQqByQqik1fBbMNr1MzQI0O4iUlZ
	 /BA6BW21Ayi3Uv8wSSCuyi0Yd1+g1dNMmzxIQtsaF1TzirzbK3NgQOSz1dUsD8oglz
	 4eKRjd1K48k0elDGZvTZYZhROKBVvhJFSQJjMbcc6F7aimBmva3dYSx4ZSAPBKo8Of
	 23WR2LkLh4HguLPN8HCB+wuAI8gEYhWr7OFR/QgIW6PIHUJIdNwsTBgWCjk81WAQaH
	 ZtSqsxrPdEh02olyQLwiN1lgU+RoPsmUMxPaLxb80qPLYRP3IlD9rVNkQNUUOCokV+
	 v9KeY7P6mXchg==
Received: from [192.168.0.240] (ip-111-27.static.ccinternet.cz
	[147.161.27.111])
	by smtpd-relay-647c665986-mvmlh (szn-email-smtpd/2.0.74) with ESMTPA
	id c0acc1d8-caa7-4a77-879e-f30b4be02d4f;
	Fri, 05 Jun 2026 16:49:51 +0200
Message-ID: <c7f35621-2bdb-4e66-ac8a-6c7fc6f80f1c@seznam.cz>
Date: Fri, 5 Jun 2026 16:47:34 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 C-PHY init
To: Bryan O'Donoghue <bod@kernel.org>, Frank Li <Frank.li@nxp.com>,
 David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-5-e50de0b557a8@ixit.cz>
 <8azU3NvUdGCvWCxLb0gz7FWkTGFL4k_xiBUPp170jiYIQjwHyRqynP_oLG4pjFkIRSY_bo91FQh9ECYlXdXrsw==@protonmail.internalid>
 <aiCiVe_LRA4DXTCL@lizhi-Precision-Tower-5810>
 <8b9f8754-48da-4b61-84b8-3688520c7f63@kernel.org>
Content-Language: en-US
From: Michael Srba <Michael.Srba@seznam.cz>
In-Reply-To: <8b9f8754-48da-4b61-84b8-3688520c7f63@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 6/5/26 12:25, Bryan O'Donoghue wrote:
> On 03/06/2026 22:53, Frank Li wrote:
>>> +    {CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>> what's these magic number in ADDR(x), if it is register, it'd better to use
>> macro.
>
> That's not really feasible for non-Qualcomm, non-vendor document-enabled people to provide. For alot of the code that gets sent to upstream we have magic-numbers for registers only, published in downstream code.
>
> We can't demand better documentation from community members who simply don't have it.
Makes sense.
>
> So, hex values from downstream in this case are acceptable.
>
> OTOH vendors can and should enumerate their registers in an upstream submission.
I thought this was the policy indeed, but this made me wonder if ALL the magic numbers
in that file were added by volunteers. And weirdly I found this:
https://github.com/torvalds/linux/commit/7803b63a1640a0a39e3ebad487b33cb2d26e778b
and possibly some other commits look like they were made by people on Qualcomm's
payroll. This specifically is QUIC, and idk how much documentation access they have,
but at minimum I assume they had access to the CTRLn register names? (fwiw it's entirely
plausible that the registers don't actually *have* better names).

I didn't follow the relevant ML discussions, but it seems to me like they should've
been told to document the registers?

And even if the documentation they have is not complete, seeing as they are being paid
by Qualcomm to work on this, would it be unreasonable to pressure Qualcomm to give them
documentation for the bitfields (which obviously has to exist *somewhere*, even if
the registers are free-form, the values do *something*).

- Michael
>
> ---
> bod
>
