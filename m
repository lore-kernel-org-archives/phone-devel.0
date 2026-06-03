Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F53D45C5
	for <phone-devel@vger.kernel.org>; Wed,  3 Jun 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489766; cv=none; b=G8oteP3TMBwuySp2nSh2LGtfhO0zSUvqZTEbSY6XtSILrHpTY9iW+9AWfbvTeQ1rzplntqeolS77fsIxRyckcm4fJa3kgdk5ntLV8tNnlvwXxBRhz+dLWmNOKHPGRbRUpj8SS1+hjiY9WAxSYUJ6qShFoD0JTw2yX9lBGF8PyTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489766; c=relaxed/simple;
	bh=YMiHS7/GWiUf2GISl0uQrQVtiU37t172Bh0fR91tIQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwtEBNXeXH2wA/2yrYZO3GxONfTy5f2NdPFW5FtcVkKmDNWqZl0zRZieS8KxCoXXOo2uVfJBTkVyq2TJbhiyUhykmYoKh1gQT8Xc/36HjOAAF6n2QLkyKqANiwQYl+yrLwvj634/rAM/JxT7K01N5xB/BkpIap4tEErlrBm/9dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onqXhhsv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWhMiiPS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onqXhhsv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWhMiiPS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395nbL780663
	for <phone-devel@vger.kernel.org>; Wed, 3 Jun 2026 12:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=; b=onqXhhsvHEFM3HWw
	klqBCjujNpHOAxiBAz3lOekrKdUWlpZCX63ui863WkH9Hb1M7/9MHQhvYud1fdIe
	EgWNFWRky8+f9bvFo4EJIhxkV06mCcDyhaI4hvwY9sJtqeGXqMpOb7EupJX3/Ydy
	gutLLmjCK29oBYSaoCHx+tD+81aGYPHBwBlB3havGfh0KVPszovtB5sG/8wfj1eg
	Q7D63DJxomJvO7Zi4S/A5ynmnTuqE4H4errGdBPlbeDk7W/ya33tJVViM72f6IpI
	LwZo9C0MM/sepb+9WTmk92+SC4xllUgc+ujq5zCo20J1fxpm7y2tpRZhp1ZO2i1a
	h2GVdQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb0sae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 03 Jun 2026 12:29:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfdce65690so1554299137.3
        for <phone-devel@vger.kernel.org>; Wed, 03 Jun 2026 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780489764; x=1781094564; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=;
        b=dWhMiiPSMKfIvp8f5P0eX3v2RBkuyWPCsSkohvLEMJ19JRBPupgRY2m+z5uoUDDwbF
         el3no8/p7mb6f9XiLQhd1RCZojngFylfNza1x29fB57PeqQtDut1+15QAwPi/rFRlit7
         vABUe83tPCAqIpobYzylY3E4RVk1xrnzkVTsNi/AZ+u+5/Dk/NQLkwEPBvXQHsRnAzot
         gny1ZzuCmJrhwgPCTfXxAXCX0PgiyuLtzPE8ry5zpA2wiHCV4vFriKngd+sl+8XUW4L+
         OBESiQxbg4a+ZUiy7n5HN4DWHMU8tJm2ndRfzjiyLGcsigqS/m1taFqsWJL78l0OT/JF
         xgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489764; x=1781094564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=;
        b=jB/Dc8Mx/LDdskmEuDoLu2ogeO6QsmgTFwnQ19h6KA6qmKUw9W0RQKonpNeedIMt2Y
         k1PL9h8ZK2Zn7WaqFc4rJgm+FnfQgLsLhrz/GdhTtujxIW4WUmDxjbZIfQ6zFURf6J23
         OLgCzJLyLM639MMgG+INiz5IoQ8uPqBVTtrCZAZSYKoeM52DSEPZ7jaex/B8Q1zYfQIE
         pb183JIEcsqqErCIh7jGB37fA8K/gaMe/DlzI99BpJXEnCw+nKsYzWyc07WoarJnZOcy
         h0ykgpOhnALZWTQE3qtcKCZ7K5JCWv7opuZXQbSy8Atv5rQ2E55B7M8uz5NiL+//OYEn
         sljg==
X-Forwarded-Encrypted: i=1; AFNElJ/7xbKd01qNKL5mEXNNRXg6eZX76M0ldaB3DHVwKwfC5gP73URSkijSOLyu7bMjVvqacdn9/EonKpET8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGMnTOXY3+XQnscjSwvq0LeWWVi4m8EH+wO/3BfTsBR/KnaLsb
	6sQw7sc8R4OfhnaL+f106ZXVT7zwrHe7JWrBZ5CZt+oCZUPQkg89ylUOVWl1YaHIzccQ/8oxjbP
	r4GBkZ6uRY4kXNGqJyffDFcynHyyPu2RSgI1ucBZZWtkwsLtCCmjGqE8vFvdRCm8Qyw==
X-Gm-Gg: Acq92OHI1eBB1fA1xngSOpH3B29N6QC0Mdqj9dj/KDi2rP54/fOPA37Wz9rdwqPK794
	Sb8XBMDTqGJhvuYBaYiksNH9sMuwU0d3ky7RJQ3U+5keq3v2U7pvWaA6WKa6RPWY8xMjqyk7Q7V
	FxOa7v5euA2P8YFo+VWAz+5ryKO9FGEsN/u6zbxmskfU+Ewgidk7jrzNHEA9xbFAZGkjKPFMrBH
	3ufAnLgssW1UFXt6PNf4dxvWxjvMQND0Bc6suEYtfowTPRHEtkXscNYx0BPWNKa8ZIUTQa6p2Jo
	FzB8RviPi1XZjmQ9Ze+li8tkA5DYxygp5OKv3P9pmFkgOzsRkhrlc80fLQKr0Lm7i2lVfG3EipT
	qlx7CKrQtG9aDNMmOuJa7bYfXclvcYcZ2NKu/j7XH/NfNQiApl64RWWXeg2KwfA9lXV5aJOU4D0
	bHQyO8pCEp3jsHTs2kA1KnBLp1IKXfSH4aUdgI+XXhD8VFWw==
X-Received: by 2002:a05:6102:5812:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6ec2b17b508mr1292412137.6.1780489763593;
        Wed, 03 Jun 2026 05:29:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5812:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6ec2b17b508mr1292387137.6.1780489763242;
        Wed, 03 Jun 2026 05:29:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c11csm620669e87.78.2026.06.03.05.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:29:22 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:29:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: MINETTE Alexandre <contact@alex-min.fr>
Cc: David Heidelberg <david@ixit.cz>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
Message-ID: <thj65jrvef3z3dmn5f52jplewrjgklomc5s32grktsjejs72sw@npk26yx2hpf7>
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
 <CAD++jLm=BxHsPJ4rgqwY8SvaefZUO+Pfv8E8xizqPsdJZw5weA@mail.gmail.com>
 <298550eb-1bdf-4d7c-8111-8b8f0b5dc056@app.fastmail.com>
 <4b797a3f-01c9-4b02-be98-7b82099c2e0e@ixit.cz>
 <48cfedcb-a9f5-402e-9973-f5c175fd2740@app.fastmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48cfedcb-a9f5-402e-9973-f5c175fd2740@app.fastmail.com>
X-Proofpoint-GUID: AWQrZmQFH7v8s_B9xO6s0bHGO7kl0kYE
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a201e24 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=JV3oGrjsAGRtxPpt7K8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: AWQrZmQFH7v8s_B9xO6s0bHGO7kl0kYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExOSBTYWx0ZWRfX6b50w/VeKtl3
 PIpyMZ8kdBHNlImGk7W2XCexY3dMmfqOB3o2pIYADvebq1RVjE125ssIAFv/Z6tVbuRegzozrii
 9n23plkc9Xk+5Irz7gdOaCobAnFyu61r6QXyzadQPZnaI0wFU1+IyuqeH1KL9cpOZgR0ijqZlCz
 VlKuRPnqb+HkibVgMIqqjkA3HVg0c1rpJO+9U7iI9yX02dNL+Mqw9FZJCRkHdAiSRmjPqpz7Fuw
 aHUqu5eSV+tTnMLSXr7mvCITqUoAm7sN319p9nYuP2tKs78U5TbdY6cfUgBHgCjB1F3zOOLYlg8
 XrXfGAtxTJVKzFp3rsiVGVIcKgjIwWwUCG4mk+mIg8sZtngQGpNlzFTKym13YQXWnatQK8dbHoa
 ScJ0PpPQKaGzs0u2HtoL4hAHrwWxF7BO5hAJrWLs4MKXW/jy/5E/8USZ8qaT89Z8s5H2e0E00lK
 Q2MYdVOkktLhisLm7EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030119

On Wed, Jun 03, 2026 at 10:58:24AM +0200, MINETTE Alexandre wrote:
> Thanks David.
> 
> I initially considered adding a Fixes: tag, but I do not have a commit I
> can point to. This looks like a latent ordering issue in the
> Qualcomm pinctrl probe path and could have happened at any time until now. 
> 
> The failure became visible on APQ8064 boards such as this jflte, and I also
> have a report that the same change helps flo/deb, but I do not want to
> add a misleading Fixes tag as we don't really know which commit really triggered the race condition.

But there are no gpio-hogs on Nexus7/flo. 

> -- 
>   MINETTE Alexandre
>   contact@alex-min.fr
> 
> Mar 19 mai 2026, à 23:03, David Heidelberg a écrit :
> > On 19/05/2026 10:48, MINETTE Alexandre wrote:
> >> Thanks a lot Linus!
> >> 
> >> This patch is required for my Samsung Galaxy S4 GT-I9505 to boot but I also
> >> have confirmation from another contributor that the same pinctrl patch
> >> helped boot the ASUS Nexus 7 (2013), codenamed flo, which is also based
> >> on APQ8064.
> >> 
> >
> > Hello Alex,
> >
> > if what you wrote about asus-flo/deb is true, then this patch should have 
> > `Fixes: ` tag, as I remember it was booting with few limited patches ~5 years 
> > back then (only one serious was hack for proper clock bringup).
> >
> > David
> >
> > -- 
> > David Heidelberg

-- 
With best wishes
Dmitry
