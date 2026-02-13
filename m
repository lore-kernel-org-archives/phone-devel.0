Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E7D35FF49
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991736; cv=none; b=sg7fz0QCEYCTrFwPzVl8+8UQ+xVDiTygq6tRR+AngcH2uUWm52Xc0Z9KxdapafrPiRD7DKoMMKyVWQtybCVHbF2jdSoY3vEAFtrWC/LGWJbev8HhztlRK2MdvM1QKcotrOPvfMkXcEnRZGNlWoC0uQ22XqWOfXXktIC2x9Uov78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991736; c=relaxed/simple;
	bh=kSxpGwm9UDimkXPadlMLx9J4LPHuy90pfvo/9O4YcSg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=O3b0h7XpLLfUpttmbpDKCKZmLo9yTIZRsmzIzGfvnHbR09hrwRV8xSTeOZGqpACqfyEKg6wgxaPC4qw2kD+WmtjynPGil8CkpEeZ2JLNycymNkSw4Rimr+Lbbuf8u7Kcgytyq9BmZ36JWIwRN0rAeemqSds+ArNdJItwWUMUPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cn7gYATX; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cn7gYATX"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so74842166b.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 06:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770991734; x=1771596534; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDWCaCmjcMdTeU70IpQ6l5t9XJKDcXByz0w6wvm7lMw=;
        b=cn7gYATXW2pTKK268nnPC96kyjE6vk5jUTQgnqIFRP5kqqObCjRljl4R95gTd96L6M
         DPnWW4erxOVa2X7ux+83MCOsBwa9Cj9NnNVtUhwZQ7DwTV31Cd/5+/N3NIN7i9zduFrp
         Qf+aU2Nql3i9pxJVZtggqel1lfwaTkPMcTA1LUiiQ+X83z8V7BIVnB8ZYbCA1OmZAQPt
         HWDslNDDUC8StTtd2ISTAIHcqNokBLZ+F7yqQE+wk062LMISnYQT+jTokXXdQfnWTmgS
         sV5womhihB1B0+Zk7Ydflgt+9DeFMPXE/E1vIOoOnKNnaZzFS55Utd6Zvf58SfeUbk6O
         PffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770991734; x=1771596534;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDWCaCmjcMdTeU70IpQ6l5t9XJKDcXByz0w6wvm7lMw=;
        b=U+m4MyEoFp76wqviIO3Fvx4ePxEqlS/dNmDIAl2ALs0QBfTbcloP0lfHMiO5p1bAv+
         WuEMDpZv9nAuqOikzk8hapZaxA2dBtggEYsrJe6HMVIQaPbe1FTXlvHGxlRJnoxMk5XZ
         UlREhA9uiCSQM7lpsk4GepkNQPfkDmowueyIj9LnA3wcRpCB84uxatP8J2Xab6gouHpe
         8NMoFi/pMeSxsDLv/tLbqbWBenPq3eIsrF5sxx1ZTWOnEy1Q1OZgCBUUhoWVt7ovx2ZU
         tLAQw2tCFYaVKQvWLXBQGAm7AUZfz3B07OpPE4GA6q6VUN1RBsn2XXGFCInnfM6ueE7Q
         suqA==
X-Forwarded-Encrypted: i=1; AJvYcCXc8bWNYVX7Ta2y0hbZ/m6Il/VPeBTtsTFOCUjO4t8H0VoSe+F9j685x0VfydUoUrmwWrDIhg681evWlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSRYjaIwoGhORzfXKswgUaHuUR7ZNB4X1vlnmbdYG/DhijFD39
	1HWvxul5i77hDSGpZ9Gk0HpIJ/UWQQO5UcRxI1zzY/S5iNlpWb1BTy7ORpmVewFbaYU=
X-Gm-Gg: AZuq6aKSZmSHQWczK9eSbP6CJ/unpNskcceMjs4Vu/lughSo6iz8vF41jBYY5/t0WRc
	r2OTppCJNzTpyY+coFFgdsv15u/OkO3rqCK6GrYtahgDqde0n+FSGUL+Vguc5nFrN2+OYYFJJep
	zr6jnJqxZ27SqvzdSx3VmlVVteHSoiKvAss/yLsCsu5+QtOqxWOsxklRhsbAJhqEay+6JVS8Pxr
	RVonMgMtHoeE+q9hnAhH0NlRT1CGD4vZrtcz9NnJSpsHOROtkW9JTwUWlxWAukHxm3u0dXNugpe
	/1zaUeHPGNupIpEfcNgZQlFMAVx6o/o9A8wajjp32sYa+gGg6Rw79NucLjZYhJXszFnjhK1RUef
	1WhL0MIo8dTlk4MYNwaGIbj8zF1W0stQhp7kekpBw0g8Q/QDeTZ1NQ7PPUdN7W61QDrcn/GK5vb
	IQNor9an5TphnCGJIJrIJMWjX8dLEfqZguzAa9dVs0Ug9vwCrOfCIkjfWyOPjfvmftuUIy
X-Received: by 2002:a17:907:961a:b0:b6d:67b0:ca0b with SMTP id a640c23a62f3a-b8fb46764admr98204666b.61.1770991733815;
        Fri, 13 Feb 2026 06:08:53 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e9cd6d4sm263856066b.23.2026.02.13.06.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 06:08:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 15:08:51 +0100
Message-Id: <DGDW69W84LJ1.2GHM2WU31VANR@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-scsi@vger.kernel.org>, <linux-phy@lists.infradead.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] scsi: ufs: qcom,sc7180-ufshc: dt-bindings:
 Document the Milos UFS Controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Avri Altman" <avri.altman@wdc.com>,
 "Bart Van Assche" <bvanassche@acm.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-2-d3ce4f61f030@fairphone.com>
In-Reply-To: <20260112-milos-ufs-v2-2-d3ce4f61f030@fairphone.com>

Hi Martin,

On Mon Jan 12, 2026 at 2:53 PM CET, Luca Weiss wrote:
> Document the UFS Controller on the Milos SoC.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

I've added you to this email now since you seem to pick up most patches
for these files. Could you take this one please to unblock Milos UFS
dts?

And maybe you could add yourself to MAINTAINERS so b4 picks up your
email for patches to these files?

Regards
Luca

> ---
>  Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml=
 b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> index d94ef4e6b85a..c85f126e52a0 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
> @@ -15,6 +15,7 @@ select:
>      compatible:
>        contains:
>          enum:
> +          - qcom,milos-ufshc
>            - qcom,msm8998-ufshc
>            - qcom,qcs8300-ufshc
>            - qcom,sa8775p-ufshc
> @@ -33,6 +34,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,milos-ufshc
>            - qcom,msm8998-ufshc
>            - qcom,qcs8300-ufshc
>            - qcom,sa8775p-ufshc

