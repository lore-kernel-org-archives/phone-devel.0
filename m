Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F4027877F
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773768; cv=none; b=Q/Noe7qCqfT6Eqjvr71wrxS9j9FX0IqjlGxtaSRG5noEbKIv32ew2Hm/UYxmiWr386cWL1Zvaa8TvnisU/M+9yvfxc5bbaE0nmgRgq76zzivIPG2FaSxH8qAipxdT7z569NJPj17GXZB5hkKrCy+zBhESsUWKZ8ywz/icRFWJBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773768; c=relaxed/simple;
	bh=o1AWs4MhRK9ALRPlsS4BuKxVmEr2fZTG2p/UNW2eyJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8sM3hRwB/hOBvJY2L6TqPtXjsU2XNBIp9XmooVy8aSldjil4BsWUpAR9rAwKXbox2v5KOZBu1Fi47ywdq+crrjIyjckF01rx466AjY1YG6Y34wYDaV27T9vAztU21c8hiXWIp1G8pJe5ZTV9ItMnMRAesYGW+Z0QUxWUqbxWy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYkU0qoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZSAmyh9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYkU0qoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZSAmyh9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076WISd4048690
	for <phone-devel@vger.kernel.org>; Wed, 7 Jan 2026 08:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qm5MJrdnuggNNNAB6F8dt9I5
	TzWW/Oz189rKFUnNs0U=; b=WYkU0qocoyMYrpP8b1PRLyQ6jyqcNuOptcrZYj33
	1fxfO3T5IGMi3Se5aveHkB0UzjdiHwynNRfKseiSx3U+z9gixYIHRfFcgb4PZ1Sg
	1DBiIyRWqVJ9hZEXQqm3UXbKwY6VkkmadP2uMJ+MH1VCdMedLPhCuKOxsHlmgpEK
	PrEO1p/pTvbXQAIPbuctuvl0gcx5DY+ohleduZJ7gF2OHBPV9VGNcZI7Qt4gyaqI
	Ff74KFah0wiFEKA2ke9zU3FSBjeOSJjG2Jkymp4KzmLlvwTL0t3VBXLb0I9FD7Fg
	d1MBvazTiCqxhLrycb9JeyiNp38uU/Pl2vB77NBaXnrg9A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25ru9je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 08:16:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed7591799eso42366621cf.0
        for <phone-devel@vger.kernel.org>; Wed, 07 Jan 2026 00:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767773765; x=1768378565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm5MJrdnuggNNNAB6F8dt9I5TzWW/Oz189rKFUnNs0U=;
        b=DZSAmyh9JiOkLcEQ/Dqacj0ug6dafZLZ+xIl/eZOImOkmfiZm6HILPFF5X/VivAwAn
         VqdRj9AXyDS949ADG2UUIXNUEgwXi3j7BZJjvnPtbExpRVUY0XpC7sblLxU7rYmVbFyr
         4foiTzc8m9Z7HKv1JMW+4I/zfD7fk94uvHrFZIzJSDA3kLrfl03ShkZHsZ9v2gyREZPI
         RajUB1slS52PWF8yVmvTacJYCZRKDscHC0QXdamsj6MCHveO/D2Ueu94eVASHe3BGrUz
         CIqDANU33pV7m12TeOWdZAYoHinNuvzEJIZvzbM5lgy8rvnzLMtXukFgFifW5b8xxGXB
         VWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773765; x=1768378565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qm5MJrdnuggNNNAB6F8dt9I5TzWW/Oz189rKFUnNs0U=;
        b=fuoRzoVcH/MpBlGQk4XBSduHT7864+0Gww9OahzF8oA2iq3y+0xXogXO3H0zjw6e1f
         Cp+DvkzTaqrCUUYfvKE57SweE1USZ5CNZFEb9qXUNc16WsRS60/ufglLWEGPyGBpZ1qO
         p9odzJa6Qb0597dtPMJ6ZtXw9Wu1mlbxYbfOnXAVysZUtt+Fm7OELSBRMqF7/Mi6lQ0I
         DlOHf0hJ1O0BUlUORLMMLGFE5HOazP/RhBYCYFA9MD0/1pwUZX4+s6un8bZL9jc+PI6Y
         t9OVWAqRRo55hCql8vLRFVe4OaQBe2Q/C1mfko/8sa4JYgmGsa49Fs2G1YFFKukIbipF
         tuHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmz/4AGxNgGWZQDZMnMlMWYhu8rqE2J2pw1bF+T8SG4OOTXoIX11ch0P3QshfGEnLSnK21oV764MdZvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDINBAIOeiOcJKTthLd9hurSjhBx5jdepOsIhyUnpRUNwAOMCA
	Y4fvD6ACLiV7k93038ElSEhKxPWqK8cAlPYAFTTkKvREffxUZpLlMnBXd4iBcoSHm1cFsgTzkdO
	F/fjuytO3IBc3JCKTuXmiGfLtwjBBZqzGSa8nYcmaTKspIfHGqVSx1pUUWYUFoExkHw==
X-Gm-Gg: AY/fxX6E3Bkh0tCaXKvSAmOaK18Z1aDVJY4ITqjoCl9gBQqdEfkKmr18eBL8fcGNi0I
	faR08d2zuhdogM5FF5QgAosvuMHXvmvztjCcbEDEkQy5fOoe47LSFDm3BrOnr2nUD2wuP+s1YoN
	uh7jdHmv7/zrcsMTfDI2CBy96hNmw+7KAAYDuHQw7NxJKKSU0fsF/RzZDOF3h1d8iY8d4DSe1BL
	EEn6idEAXArXsHzecZjwvsIyAL1MV5CDVcEaucOMtnuliA0NuZG1c0YCI260L74sGJF18cdZP/A
	GRzRHdqYDcjwVbUqzEWq1giHfXCiyX0bPhElFxuUMvQ+8/87L5T+XLb7V84NjKF0Tf52VspdrgR
	MxmtFY14Op0Z/NGCqevKa6x8hDyQjTcaz3N1PdOB/rxh+kml4arjXKEPtYZ44ULosVtrpJVRlWW
	gQuU37hl4Emhvz4LLUMvZM9eA=
X-Received: by 2002:ac8:584c:0:b0:4ff:b18a:104b with SMTP id d75a77b69052e-4ffb4958e3cmr22071091cf.23.1767773764785;
        Wed, 07 Jan 2026 00:16:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLeBGot7Id1we2Y9b6hS91s2FZEXZi38CtpMmDPlfGWQHJ6LjX4679mu2YzAgFfrJeuO7bxA==
X-Received: by 2002:ac8:584c:0:b0:4ff:b18a:104b with SMTP id d75a77b69052e-4ffb4958e3cmr22070791cf.23.1767773764383;
        Wed, 07 Jan 2026 00:16:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d108sm1137893e87.27.2026.01.07.00.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:16:03 -0800 (PST)
Date: Wed, 7 Jan 2026 10:16:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add UFS nodes
Message-ID: <jbunqx5xj4kff7qxajgu7lszsmkpw5cq2bceuz7d2me3fkydph@k5b7aqggxb47>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
X-Proofpoint-GUID: ilimUgKz7GFSRcbdftSrXd7Wcmud_cPz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NiBTYWx0ZWRfX8lbJiTBu/Mif
 zeo36JHU92MqiMVAEXI2A9NgG7rOe9KAsTxRc1i8p+mtufnGvMVFia+7mzG6shuE194wEXk6rAI
 UauLw6GUdhOIynX+giKPMuMGXZngQGeaL0rZJ7MMmXF7QVqCMwPMUsbaJ3PN6z8aV29oRuPen+d
 H5aqh2WSjNokVKgq/jfgN2Rhh/Hzsm4wgc5jPDh0VuHROq8uGBkxGlZ+cIWFG1KTdv3Erzb4IGo
 OC4g7gSwgSBbNe4FT/f6HiqZHX+CVnDeJps7NGRQ4WnqbCKgwdbgNFSAizHX15P4YMEeBZoHC+s
 bGSlkJ4ws0OHld3wC+lfSP3WGz//JtHfy5YnyP3C6hWW+3O/fijb0h+7AeduYHV/3FKpa1aApzX
 sXMV2SA9ua9tU4zgCu9dizW7BMjFX++7WHfx/tRlwNLW9tA0YT/mEihln7oeAn+aAFFD5OLd2Wb
 8j+6VuDQiWGIsBXhtBQ==
X-Proofpoint-ORIG-GUID: ilimUgKz7GFSRcbdftSrXd7Wcmud_cPz
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695e1645 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=PvTnMlK2driW4fpN2xAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070066

On Wed, Jan 07, 2026 at 09:05:55AM +0100, Luca Weiss wrote:
> Add the nodes for the UFS PHY and UFS host controller, along with the
> ICE used for UFS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 127 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 124 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
