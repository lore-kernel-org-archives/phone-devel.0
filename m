Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F76218AAD
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 20:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759522473; cv=none; b=Br1jc/sK+IbR6ANX09D2l63bB4KXU3J3nnrSjYB7G3DNcVO5/ulCdONa8LYe1skEZ9f1xkdf4CzQXohiB4tf/7a1sFHmLl6DoWPa4K4aIkb9BFbF4Bi0WKYdczrBmnGFT3AYynivXLzcCsLi9dDL3owQOnYkl49W2xHOCh2Xxys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759522473; c=relaxed/simple;
	bh=fD8n54ZX9M0RRQRWUXO3tmRnzc0ewZjTWlfVmwaUwfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icdf+bCpL8/J05GeiFsRygVf/j2Lr1ypYs/AGDQemMmeXe8d7jWcKfOyE8XKNYIDJlbwuR4gyFz0omWUWP/0C3Bmz7EPhK9LZ3zy2OWVGFhQDxu5juiocW1MhzMs87bVVjGnmOni+CtjINC05Z/UGOUDSfmxnMgos8M/LRceAGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctDr/41q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctDr/41q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593Bf4tI022686
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 20:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3d9SzCzSMJIBbQowA9w6QpPw
	22iAr4U27ZeiUZsWKrA=; b=ctDr/41q1epOH8JmCATKNMFwBQJA361qEiMbkHGK
	Vu+8JQ3OS9BLn7HIKjNVx3K45tPXip9z2SKTlASdb69+mpI0zQEeuZ9+BP+1J75f
	JPc1phAtYdf+uAGL48vI0aJEl+d7LIteaJHTzoNyzBN//KgHtIMZ/PzhLalDrOxA
	PsysQPT6TtqgrLmC9D1xSjA4kFm/1xFTAao897ajXeC0LiJRQHT6z/T9Sme+H4M/
	VPhD/POypn3o8R/h3W83hZ9E4MZwdWsOqcjTApMk6JGM05iCntwrgXmfRtvLYFA4
	f9ANutiIlJ0c/4v2KvMpM5gwKAXTebEM4X3UxzImI/thfw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59nc7wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 20:14:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78e45d71f05so54455636d6.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 13:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759522469; x=1760127269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3d9SzCzSMJIBbQowA9w6QpPw22iAr4U27ZeiUZsWKrA=;
        b=M4nvAMXEcHfkQ+R14Xm8qg0QolAN31AGHqet70V8c9KH836KATfk4GKJp+9TNVrpSw
         95oPIY/7AlgJxwry7oo5E70vz2FCpGydM06p1mqbsb9aL4BzPqYwVWfB9LNH8ygoE4kj
         VRskG9mdmfQ0WtEp1zGbM6QS9athECiGk6UoCYlgpqRBSllVi2ofhz5mHmEmaAEp8e6z
         WNJuBFVOGBK2wvy8pNvlB3hB4Nkr4CLsMfHNYDumbqxOYiRf7jFz4UO3yqIIJM3O1dEt
         aaHoPfRK0h9S1SgqlILTfcPBBVDuZfuMDUS5Kif+IFJv4xzmIFiQJGSTubVraE+RdnnD
         Vohw==
X-Forwarded-Encrypted: i=1; AJvYcCXQrYbGbaIbk4m0kexor0Cqrvv/Knz65OxBsswtjVYTi4z3ECeyqn0v4whcztkXAomAOevJVJyGkn8fxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8TeoTwGG/R4uqhB0wVO8pdR50XmrAuDFrUEH3hrhCTOsn2CE/
	gyfISj2Yss5h2QrvoRRm4xOyn4M5+PjdmJxvvBudE331azvIAFMLG4nj+8BZRWg+gF7J1+bZ7Nw
	d1tZEN/DRgNShUMi5gTJvKHe0vrEAtDxd1I99MIyXNWWJnEUxfKWcrkE3OaMUUwSw0g==
X-Gm-Gg: ASbGncv+JnDIsJHLqxuksAgl4HXgpe5CdazBpvCNjqdBPzEn6F9Blh2rKNqAynMpu6X
	jA4rV9HbrFIIrPmA6dalzYpKE8XABzPE4QISHqNRiFOd0239LyXk7dU8P6zAEILsvaeMM26U1du
	kY1QTI3hqIkFeH4iCZlJFgERSUl+N3jSRGPtdUBYVd8xf+LOFLPjuO+ThFJ7UUMKe0CTNJfg9pD
	kNRMjpyyooRYBDkyUgPkfVtr5LmTrD/nBHehSPLm1T5OsEwuZ0xPCu/tWOLr7AfuyQxnkfdNu0G
	KCjGe/Uyv+VCA6o5duHVAd7w7K7u8cb0kzn3h/2K79SFi93NTkbcQ5j1P6ATpriKoO7/1yX3EFq
	P8Uy5Z2rFt9OzZjFIhZdGi+Izfdnz5FOWQ1JWJpCwCC3YaCV5qiq0eHImGg==
X-Received: by 2002:a05:622a:1482:b0:4df:1196:f56f with SMTP id d75a77b69052e-4e576b43357mr58964071cf.83.1759522469191;
        Fri, 03 Oct 2025 13:14:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqQgFtCLDGX+O3PJbNb1GIypKvYOnVxRVaWG1pkNYoNTcWC/bmJvu3v1drdtBBMjl3H1gE3g==
X-Received: by 2002:a05:622a:1482:b0:4df:1196:f56f with SMTP id d75a77b69052e-4e576b43357mr58963591cf.83.1759522468538;
        Fri, 03 Oct 2025 13:14:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba2b79e9sm18024371fa.16.2025.10.03.13.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 13:14:27 -0700 (PDT)
Date: Fri, 3 Oct 2025 23:14:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
Message-ID: <wudkpzky5sqrhqjfm3utrd2tcmtalszmyw3zts246pop4a7aj5@oro2wyqhtwaw>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
 <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
 <ad721948b83a54eaa34f367e12564fe6acc222a1@postmarketos.org>
 <gfbvgsen75w5h7afyo454pvdfslkeprqyuycuok6syinbza7vx@crapzdo33re7>
 <b9285a2e81ca992b9fc560c78ae03921000e388e@postmarketos.org>
 <budxy3xza3ieykmrp2anpiz3gktq6mc3pqohkf6ew23jun3po3@jv2em5mmhjts>
 <4db4f0d411cb250db2d513690c93f0ff5a6dcbd9@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4db4f0d411cb250db2d513690c93f0ff5a6dcbd9@postmarketos.org>
X-Proofpoint-GUID: hUC0BVTe3mhsTseEi3-36U1d4_SiXMKD
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68e02ea6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=p0WdMEafAAAA:8 a=85DtlbXH99wPiBcwuMQA:9
 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-ORIG-GUID: hUC0BVTe3mhsTseEi3-36U1d4_SiXMKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfXy4QtKR4tgwp2
 FbZ6GaHEANSpPK0XrS26ztXbFRFVEqPhlGAPBq771TgaCpWoiSJVsGdmxSyr5IXYyW2ZIfjZfjo
 RVRoaLrL8NAwjC9DxnsR69QSkiBZKIQu5NScGtL0ugFgKFr/CTfBe91ScNscYtzdq0ENamC8iRo
 f4ySBAXp09QDmzr8Lut1uLnX85UfrZ5B60Dwk6EOABgnjeb4A21nvt0/6bl7tPPpSLnEFfCFv/J
 idlqMV/ywJYrlPLBw5LGKgBUeF+q0fSZ/i9F6TENBUxQ2+pkNO+KPJpzxom10i2YrpNczVFjOHq
 /HI9Ep8JQA4HbARmYZDN6R56DqlguM5OdamY+wgJSZSMh3Z4tSnLOo9Dn5B5nnwaTLgGiSCJGCb
 1/w664a/BYy5lRaXB//7iCKNOCW+uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Fri, Oct 03, 2025 at 07:55:21PM +0000, Paul Sajna wrote:
> October 3, 2025 at 7:36 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> 
> 
> > 
> > On Fri, Oct 03, 2025 at 06:52:03PM +0000, Paul Sajna wrote:
> > 
> > > 
> > > October 3, 2025 at 5:13 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> > >  
> > >  
> > >  
> > >  Regarding the MDSS. Is it being solved by adding reset to the MDSS node?
> > >  Or are there any other issues?
> > >  
> > >  Yes I'm referring to the reset / pmdomain issue. Joel Selvaraj is looking into it in the sdm845 tree. He said he tried doing what other SOCs did and it just got stuck in a reboot loop. More investigation required. Currently he's reverted the pmdomain commits in our tree.
> > > 
> > Which pmdomain commits?
> > 
> > -- 
> > With best wishes
> > Dmitry
> >
> 
> https://gitlab.com/sdm845-mainline/linux/-/commit/002ebddd695a53999550e241b71950f1aa0e1ac4
> https://gitlab.com/sdm845-mainline/linux/-/commit/09813cde376d9d8f30eaf761534532101a0a7755
> https://gitlab.com/sdm845-mainline/linux/-/commit/0e789b491ba04c31de5c71249487593e386baa67
> https://gitlab.com/sdm845-mainline/linux/-/commit/13a4b7fb62600e1c0738fdb0b7176555ff05aadf

Thanks for the pointers.

> 
> All got reverted in the sdm845-mainline tree, I believe related to fixing mdss
> https://gitlab.com/sdm845-mainline/linux/-/commits/sdm845%2F6.17-wip

-- 
With best wishes
Dmitry
