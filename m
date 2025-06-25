Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF0B19D07E
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863698; cv=none; b=J7CaQ4Z5srWOlud2vXxUpW4bkphhUuwrh9D3M5oDh4bdM3KpMW2f8E9TZvw19Z2Bo0/uRI51sxIK1ZoZBy1AGfc4UEVEW653DKRBzKKvsnf56hgOi6W1bKE7Q21/0kAPH21H6RfF3J5I1IHs5qJHaLH2WGC3aSPBsBBeQ9ZCYcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863698; c=relaxed/simple;
	bh=mjKGXvYRAeV0j9q55iDsvNYd/AmBtJccQ5OLEaOQmb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eBVsk0kL6HE8MVgvtjeNVeheGPCnLFMvFxffe4M3Cp/ceHvyJfs9VQf5JJ2XAkm31hgmi3vn77OyVb8UTTjg2QEIKL0YNcutN/5Assz9tNclZg5fzVbEignnHErOfIJ4VAa7JUGRixwAPDjPtACkyEIAj65WkhFpXH+vMK8UoiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1Va061g5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1Va061g5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so11712908a12.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750863695; x=1751468495; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnhUDg+i4p9VBXEoyxzKCCrO1ndShC+avgmK0GaloHg=;
        b=1Va061g5uxi+ZmMR6Z9hmFQna/WcktJ8rSPg/wH1PoaEqOHQwWukTV1BsfVbhioM28
         /mhOd+nA3mqmOCqFuGyK0MmHyIfjzzcfgiH4WQUmR43mDgKOg7oHzEZ6gEEKtSWCwYXT
         aTJIRjR/uPuz1YcTt9V9lE0UHi31zEEoSyPRyVYo/DnZBerSauhto3Ikp3GTQylDJlNs
         PMED0YTT26CW6it/ijeaDvTeRWNgaxQCshJCnKTPQElyUioZ0OVI+qMrfw/k7fS7SSlZ
         A+C701+WL8QHD1xXTOvp/ELXSvuJVDDcRFLD2TJWSgK+++bU2VUT1Tc6i0v4DsoMoNKz
         SzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863695; x=1751468495;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OnhUDg+i4p9VBXEoyxzKCCrO1ndShC+avgmK0GaloHg=;
        b=NBWjTRXxI5aZogo+L31PWau08/CgpVtNQg7hXuFUN3+sGALHMM/LBue27qSvEa58Kr
         9OqfJ/MpSvpCHbLI0QVvDsr3pE9CqJ35jOTS8KvNyddEIzNTZI43JjPnBV3CdaBlzy1R
         EOiIk/UCBzpvJQbsAntcW2JQZ7qe/kueAzKeJZpz6sq+jqrrP0EXbK9mB/AO6/xgYgPG
         NKYPz6H7T+Is4y/KSnHkym1usFoax++gt+P2xHe6QK23VN2OgUenCCOcZ6VUqXyXw4rm
         hUiKN84iS5hC1hWoBnxrNT1EigqMC0qDuLBTGZeB4xlsNorRIECG63IRhBSab9n+bOcA
         2wWw==
X-Forwarded-Encrypted: i=1; AJvYcCWyAkEsdw02BhFqUVN06yrOWxiSrQ4Tou09XuZna5k2GyoYCiX0jVVMc9dnF2adsAMEYQs6fdO6k4sPSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywdFhRqcPKzd6bochgzQ+f7GgkevuiBZ9XXwUQILQiiRI6wRhB
	LYeW+lASWoP7CP3pCgYDCIqojmAHohKbOpjFenmo7K/yXao5LUnVgByFbuwl3ZJTNa4=
X-Gm-Gg: ASbGnctMBNvrUTCz0tUBra3SjQYihDpu6VEbEPiOA+HxR3wCjVTJdobmOu8I0p/S5Z5
	RiqTOatdvWWGTSviTV/n0Ra7utChgEbE/0eEvNXjuxGSydgknG2BQdKQUMPeuaQ7oR9zTJTVPL4
	mm1fFx7vZX+BtUCSrCQDzwsk2JVpNJUdushGNJHkpc6Y8yTiqxuEwPrPOH8Z5WYX8Zsun6wp5+9
	iNeXy7S4LdY8joGqDDqaMc7iDg7YlzFdhj21zeFzQ1rrS53hzwxMEO1kkkAkdtzwKt5Y4cpLSai
	g+xj1hJo0o11qe9D78MEmwwNGKK+9dEsbE2wRg/wswYHx6d+IjRH40631eU2+BcMgooA6z0lbs+
	nTkPpEL7kKRiYDMFw+lcB/yRFF+UF7d4=
X-Google-Smtp-Source: AGHT+IGR7eTLwLr0fdOCYaZCuvWw+/lu8Yn8bZNjsxmvuaS3Yo6hqW5sayVf685GRx2r82h70xi24A==
X-Received: by 2002:a05:6402:84f:b0:605:c057:729 with SMTP id 4fb4d7f45d1cf-60c4de864a1mr2730749a12.34.1750863693017;
        Wed, 25 Jun 2025 08:01:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196ab3sm2609163a12.3.2025.06.25.08.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 17:01:29 +0200
Message-Id: <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Fenglin Wu"
 <quic_fenglinw@quicinc.com>, "Stephen Boyd" <sboyd@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
In-Reply-To: <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>

On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
> On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
>> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
>> and the devicetree description for it.
>
>
> Please use PM7550 instead.

I'm happy to not follow downstream naming conventions if being told, but
do you have any details whether PMXR2230 =3D=3D PM7550, or PM7550 is just
another SW-compatible PMIC as PMXR2230.

Also we already have qcom,pmxr2230-gpio upstream, so that would need to
get updated for the PM7550 name.

Regards
Luca

>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (3):
>>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
>>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
>>       arm64: dts: qcom: Add PMXR2230 PMIC
>>=20
>>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
>>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 +++++++++++++++=
+++++++
>>  3 files changed, 65 insertions(+)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
>>=20
>> Best regards,
>> --=20
>> Luca Weiss <luca.weiss@fairphone.com>
>>=20

