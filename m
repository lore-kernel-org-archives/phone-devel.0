Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF9E3624C9
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773993496; cv=none; b=lweTTYP3bDb2/5gMXPgQ15hskJjoYqUCDB0mYmTo3S/+jAguSlC5S7LnT7u6Uq+z2kXKrLLUeO5FpQ+J40cNT3qP11oXJWdN/sVZ80j931ZCVaMSHaL8yFkfPpy+6yeEE8d3GPCMhn+0xd+QMiAtpmvbr5u7F6bBI5hDszU613M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773993496; c=relaxed/simple;
	bh=9eDed6TPehI0qw7uXAXp2VHk1yY3TdAoNKukjEeQP4U=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=M/c0w+TlX7TbNPE3yZQyqhzjavgCf8CwqrkJYIDBD87muZk9mrdeBINT+uYBWxY9q7G7TxRTgLog90M6ZtdExLQY0REQl7m+QYIIkiQBzKsTxR7cqqAgkQ3zEPGsCqGVP6DadSU2yZh/T/dL/rySsMxod7uHwezXCDfIc+uUBMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ESQtkPJh; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ESQtkPJh"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9358dd7f79so58026566b.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773993490; x=1774598290; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eDed6TPehI0qw7uXAXp2VHk1yY3TdAoNKukjEeQP4U=;
        b=ESQtkPJhQT4pk5U+DgbtjMfLeXxvR8M/HtCVxCfaZkx7k8Pw4S9z9NISRDUgrmjCXi
         VGx6CkgW+ME4yG8v8tpYhH8KGqhZg0B84OVm1drfOZS6X+L/CKSlTsBHL2c7jlttwMGZ
         W5UZy8SObvq/NGmZBm1+d9R1pp+e2JmUEmpLCuX4u2UuNIONJecDj6QAGiCTwceBiQEZ
         eqISmnRFmuaj3YWLGK8UTL4ingazOqdjkeg4wmd6QSxSgSKHooSLfDbRxYOrL7KjPE7p
         cqso/AAH8aVjVmFoH9/LkbycXymfKWCIpeh6MQdtmdWWQjqy4WDGKAN4j88KSSJFLpWL
         WGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773993490; x=1774598290;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9eDed6TPehI0qw7uXAXp2VHk1yY3TdAoNKukjEeQP4U=;
        b=OcOTxbI+Q+CK1/E3Nltbw69DbKZiOxM2i4v0Ii531Gtrrg5kFEXFv7eFlFfgdyV7Xy
         YBRvUvvMAEV7eqq3w2ymcaTnmAf8jHGn2NBKs95ux5AQ48rFwZT3P2Gdy4ADq8aBi2tI
         sJjPkRe9ArKEFxVB1b5ejZtSjlM5YhQC7IfyST11bsmFIpdCtWXadgz/Hda+DC3Q0iR9
         nS46UBRq4j09XmvFZNAA83d6i5fBM8KfPtKbZI16VF8m5Uv1fazfdV+Ra2E3OczkahJ7
         DanU96ZwdWPwfSznE4BQNw26IHUqrhI27MZnGmTgOOayw8S14AePb/mjjttNUivr/19O
         iBug==
X-Forwarded-Encrypted: i=1; AJvYcCUgc7WQSRuFE6egyCQp62Asadt5z8sKE0hXfL5gCfBR8+9wowQP0R8ICK0Xnjdcxq3vg2+3HGrIUyxN+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpj1sLmGoCFD8j3Qu7fDKEkPoPqxXSAXxYFVK++umi6f/fzLID
	dRwCCBaWu7aGLY1Q/mn5mlEZpQHpXtFaRa7zRhyUmpLnF4RevXS8LDLW2Iz5/3tGdTk=
X-Gm-Gg: ATEYQzzuZD7R0ezNI8bly2ktOakaAhuo+rlg8J6UqqfEpmavneQuJvsBBcGyp2Vrkot
	XgXUmRlufaqOXa4dTwrkraTahmBT1C82rZwdx2krSOI+vR8XzfyihxKdfIe/prkn0oBh8Gb9j1U
	Dsz1mokbsrXfCOp/5BwQejri73VjhnUPHmoAXGXoYS6s4xx2Mvh7gP0q6v4AHufvop8mxJJWorA
	GWZJw4SXSlxulAAUbnwdjCZ05aaN7N3TMVp47Q9E2h+5ps8dMc6du4mb4hFzFDtQHHNyhF7hMuT
	x/aaMdK3LjpJk47KOfPC5Qb+6r8DijCXLfzkcIqEXJEClDmUtg/UEgQVdfjtbywbpRpLuUTr2vV
	omnBt41jJC2cGkqpFsOAmxZTG1p1N3Zu6dTkZLHIZGq49+6Z0jkBM2s5vZFoGFtPrHcI9IrEv97
	o00jTbhcvQSPFiZHzI/emRERC+cezYcIXcPKSr3BybVD6yLOWnLGR3/xxDsntb3PBcF/gy
X-Received: by 2002:a17:907:6b8e:b0:b97:b6ef:fc8c with SMTP id a640c23a62f3a-b982f25c0e0mr131299366b.23.1773993489994;
        Fri, 20 Mar 2026 00:58:09 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365dbe4sm118826266b.47.2026.03.20.00.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 00:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 08:58:08 +0100
Message-Id: <DH7G7HV3PUXB.16AVBPYQDC5RD@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos
 compatible
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
 <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
 <cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com>
 <DGDV2EMXHDS3.2377AQBNDDHAV@fairphone.com>
 <DH1LC0C4QD0Y.1XKV1PWFCBQRN@fairphone.com>
 <jexys4ypbizesa3whuvtq36t6hpqm4httlbwtzkulz5pld4yul@lf3joaistvfb>
 <DH41T22PJEW9.3EO3P50QRXG8H@fairphone.com>
 <7d3f650e-38f3-44e3-bd70-319a16d142a1@kernel.org>
In-Reply-To: <7d3f650e-38f3-44e3-bd70-319a16d142a1@kernel.org>

On Thu Mar 19, 2026 at 5:58 PM CET, Krzysztof Kozlowski wrote:
> On 16/03/2026 09:03, Luca Weiss wrote:
>>>
>>> I went on and checked. No Milos's soc_ahb !=3D camnoc_axi. They serve
>>> different purposes.
>>=20
>> Thanks Dmitry, appreciate it!
>>=20
>> @Krzysztof: Could you take another look at the binding then please?
>
> It is two months old patch, so for sure you need to resend it, but I
> gave my tag now.

Your concern was addressed in a reply in this thread, so I thought I'd
ask for your R-b here, instead of sending another revision where you may
not feel like your concerns have been addressed.

Neither option feels perfect.

Regards
Luca

>
> Best regards,
> Krzysztof

