Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384FA4ED1B6
	for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743051; cv=none; b=BNyBKwrvz2eZk9gcFHjQawmDNE4CsZZ/9tIytyg75VhgtmIgS/Oy9oiLYoS+SPomCKNaHFNwMTXmCDl8ANnL5UmPUIdxhpIhNiEvTgdtoyuSFUWh906XDhfsGmB93zaxrSbkgyD5kQ+2cq8O4Kl2JiYM1lPposWqn6QQqUnd3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743051; c=relaxed/simple;
	bh=3g32ZEKgqgdm0mzzfeeD6m0KdEMdwsvPWO8RE57p70U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BKTO1wXefQHPIx4B+FVCL23N0iEFaxmxnm0DFsKJxU9y8xhbXlBKulaYuoQFsRIQ31074Sc80tV/nUz8rubeKgFjN3khP3cttEnqzMFTxnM8kG/GaHzB6oh7o54kOqFvCyDcUY7OYu+rnDNa/J0JIvQJap/TiE2ef8SyWnr+bMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=A7uI7+nT; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="A7uI7+nT"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694aeso48045866b.0
        for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789743041; x=1790347841; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r59C/B+bGqeFr3iprC+rozYulFppGtTTZNSFZMONdm8=;
        b=A7uI7+nT5gTJYtUZNUuYVj0NK/8INYXpvT+dj48RmCsB57fE/H/rXc36w5gh5/p22S
         p+U7aE1ARtIxOHE+TjLcNDwh9HRz30R1WDJV8m4SEgj6xvuSnN+Zet7n1YCLuo6/lLJE
         odhfsumAtx6xlZH1ZVm7ZJw14YK1AeITvdumui3LFC/QDAlGy4jsev4AD2mQKpO4fAzm
         BpJYHF1aqFycfttDoX64FQqtf8nSH6Gqcw0HS2/5NrS5HZ3YFH463J8BM1SqmddbbH3o
         BAtPLeUI1sjVn/3vr8PZISNMnL1EV713XZl2bCoMfttdl7jMlD2T9VTjl8BsYBTwPBUm
         S9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743041; x=1790347841;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r59C/B+bGqeFr3iprC+rozYulFppGtTTZNSFZMONdm8=;
        b=GHOxtl2WFzsNoVgAck4uHJ2cUnRtSSrt0honoYArO/T/ErtTMbkohYd60f4ZhunMDV
         fEd/60shfWmUjldPPf50/b5nYsGnTrgWji+eeIE3gjuHarnza1ZPUzr/dbkpkuzbKFMY
         r0lgA8gvDL5B83Tl1ItlEF1V1FaoYXR9ddvmtckDvlunazz1wdC4i3oV3dd2btA/sYAq
         Zd8V7ByjizbIRs1g7VIqL0qrUyBi1iC7MUSGkUuTlwDjeZFY4nJb+Z/4cfMgRLd+S+fj
         niVUjoAwmDBX7VUV3LqNyQVs5MxDrZ63StGWviKfXX3bRbM00hCf5mNtI5E0eoPrkft4
         G0JQ==
X-Forwarded-Encrypted: i=1; AKwUvBym+1FFbs8+GoGlkHq3ZfLBwcM5R0P1EFY4EgM/o/gVWKm1SmjjV5bgLV0s/jCluta3NRIug+tRO66yQw==@vger.kernel.org
X-Gm-Message-State: AFuF++mcuGeNY2EhfOt9FBWLFOuROP6GlixXrjEWm2mVivApgXfJOBLg
	HZSlvBq4MH/elssKa8ufuaTkC0q4wzoxgmof5u+SJdUg5fGwpwtNAHKOHWaAG6E8MhAdxlMLsd0
	WykBH
X-Gm-Gg: AYBFou24d8ZJdSRNVrnagfBwX1NbsG4Fk1dI4GIB30yAl4MA7Yurvl3ijRtG+jvWb4j
	r6nSkHFumqKxKl2ce1993V/9Qu3Ddg719rZwIsBSOXKPIMfB0L6dYMye12ye7seJWkBkqh7Sqm2
	KM/dTN1kcxZMAd9ZC2cNX3eYO4ZSME/xqk4bI6kk/xCRBY4mTwkr6sg0y/oH77Cl6Qk8QUEqRp5
	yS+9z8wuKR980NblSPYdVMxKpmdE7mqdyHWoFXMcfIk1hKKAOWFbECvKImXHmMj9jagmlx1ZNfU
	MCdvHdkpwOEZwOTZXpkb5OvpgtWv6zGIzm3vKBQF1wKPE8g0++qKYh/9PFjqI0Ap+KbIDCg9NTQ
	hvaSLh+Wxiuek0u8gibfeR1GLnwcXzM+A23NcJMImZU4coFAvh1QCF/uGVYRAkb69V3PQI/ShTD
	OlqTyImkCHavGln9/CNXx85WuC5Ulp62dqpoSdABXXDFoiHPrmgTx4PJgEmUon3Q+ueYrLB1nLq
	YjbUlefniNfwzZh7vPYngrwCeBNlyhZrs842rkg2VfdaptY7ztjCA==
X-Received: by 2002:a17:907:d503:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c2a16597a38mr269720566b.18.1789743040987;
        Fri, 18 Sep 2026 07:50:40 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb46f0csm66329766b.32.2026.09.18.07.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:50:40 +0200
Message-Id: <DLIIYI1PL2MG.1UYJFILKBWBEJ@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: OSM L3: Document
 Milos OSM L3 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Georgi Djakov"
 <djakov@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Sibi Sankar"
 <sibi.sankar@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Alexander Koskovich"
 <akoskovich@pm.me>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
 <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>
In-Reply-To: <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>

Hi Georgi,

On Fri Jul 17, 2026 at 3:33 PM CEST, Luca Weiss wrote:
> Document the OSM L3 found in the Qualcomm Milos SoC.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Could you please pick up this patch? Thanks a lot!

Regards
Luca

> ---
>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.y=
aml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> index 41b9f758bf8b..17690ff34489 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -29,6 +29,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,eliza-epss-l3
> +              - qcom,milos-epss-l3
>                - qcom,sa8775p-epss-l3
>                - qcom,sc7280-epss-l3
>                - qcom,sc8280xp-epss-l3


