Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C94AEE2
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 03:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774408694; cv=none; b=NiUcqz9Odr2qFYKs1cE5gKGrdAR41tZA2kEwqRzPpswtmBg5XzP2fLE3d5/K4Quy/OXyDQ6TIbYU15qT7DynD6Q59GmymmJ9xoRvF03UklTxSRqbiOMX2KQppTth7azSNQSAYcdECtxfK/t4u/eSEsygh/V4Qv/XYgttHzKeCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774408694; c=relaxed/simple;
	bh=dSW38DdYZZOv8pvv9YDdYAaMcK88hyE2l6wpiXYKz60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trh+o3Nvny3E+tZGzx7hWLUZRr27qRMdgCmbZ9V/iUvXszKddzYS5dZ+t+zys5D5qIAPKxSjU4YtifjZ1FXrYss/JV8mQ5EFg4eLpq/UvDKlIyvgtPnejKcUmuNPjBCAIvFEnK2av/E/YChxlFU+E1opO/ja9EYbeomeUh+Hz7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V14V8jiY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcHPFTSE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V14V8jiY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcHPFTSE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCsDG3110463
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 03:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b6FptCPcWAnccOmmGsCSiJec
	7ospPWnRnPEalo1IhNU=; b=V14V8jiY8/Vh7OeWBacOdmqbC9tI695Sm76Iaxzb
	4/bew0OwmOZmVqzFqtPL7TqmMjDcBWulQ4viAHXV98SY3NpN1zUZT02xMYHDQCoe
	CvFrA94J8pa4Y5Ijfeu2x4yrW/622ZehJormMGAlGgUuHDP/U5FbkhQrt5L45nG8
	HH1eB1ObJJk2q/qK2znbJwiVGK+QRLLz4YsWW5x1xwgKMCnEFGll0RJdOIJ/l90+
	OrDsN1EuEov1wkS3QBRrNRNq1O+6fB/9prQ5Sx1poojfhCjjNcAEGHfedEDcixq1
	u6IFgQniD6y7BI6m3FQEBDZvlX/IG0i4r3kelswIHL05EQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvtg82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 03:18:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso149173011cf.3
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774408691; x=1775013491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b6FptCPcWAnccOmmGsCSiJec7ospPWnRnPEalo1IhNU=;
        b=IcHPFTSEkfnyMb7EU2gi4qPcS9ZLbqPJOiAL47BdbUHJAVd9XAE8k222jD1yQnJRX2
         PniboFOSYg4NR1oWT+UXb3jJD6f2m9lbdDgpR4R+wGQhh/lltCO4E3Jj7AqA1iWd5PXx
         /YuaAJR9tUFxuVKWUAFJrAp2RFZNRIur7+NAzizlTPUszHO7uKRdauP+sEqZj2kHM9nh
         6kh/V9vMwCPjvcyVionceMfN8FxR3EjjujjfJwMJUFCQrs+MIQJvef0WJFTF99HeC5bI
         OdUgKoKT/tgcq5c08gkTTXFbZjHasJ7KsnHEDezWQPtXUUfqrVuICQOJDfgCr1JWqBGs
         9cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774408691; x=1775013491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6FptCPcWAnccOmmGsCSiJec7ospPWnRnPEalo1IhNU=;
        b=cYUiYpE47jj9zEzBA7EbPfMnJ0oeNWnSqiGj2JdWYbTKgB5VaZno9SHdsGiM53Tsrh
         KxKLs5ZKRUe9tTnsY3wSRQSuV/H9CIfkqHgfauyhZfYaF/lB33rs+1/PcdYLAAPPtSf3
         Ku3FpizMssschw6uyFlYkHHTDA2BycmyjjLjjtC4MPTNip7afN6nwpN+WXvR72ocy7Rv
         IUD5YtmIIQeFPbd/+oPo/Nn64LUWHNaZyQMdNjlMcUHnpSDPoK8K+w4r0Nq/1Jf6PBsx
         TBHJs7/MwA1kqvW7ekq7Csz2L71mfXOK7hLXYqKyVFaDWY/xP1iTQOE+GF+Dhj/tfZmf
         ucFg==
X-Forwarded-Encrypted: i=1; AJvYcCVgkRTE1bLdh+V0HcsnudfVlZWzGYKRY7p24mubUOG4zTg/QmDyc5wvc7iGZwC3Isct8iEjPndpxc5OpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1WhqskLF0zQuUdMFRvqQf2A9NuqrIsPc3bCuBvhHVXLN4Jvy2
	27bzEale84KmSjD0rB+5mk56AnCOL0TZbnU1tqQsNq3axonFd30RNWQ9e6qYwsytlzZWRlPZSu6
	MGiza3gwlh4HYyMUg1gMCyXMXRIydxP6YtSKT0Gop/gkrqMd5EMI7NJ8YxE8GLEylmA==
X-Gm-Gg: ATEYQzxna8SAnS4IQHpmL7/rxMy0pl1Vr68lqs9zpI189br+SsCMqi6BDJRdewN2iU1
	DiL4x2QF5hjgG28HzxGICzVpQ7RmMwyVeban9p4r2s8NL1E7gQrxY519mtizJraiyPzV6zquUwf
	ZQQJEaVuN25iZmoj3MHwHw89/RbYJpS8tCh+MrAXCb9sSgsbsUCSMh7odbnCSWWG8qWamsKCeRN
	pU4iIXI8dh/wg3N0Nh3seNW1NQSlYH0bv52oC9EDWciscCSy+1noebcx6XE7wqj6DUsW6ynV5yx
	WQ7FraKGYQE3CPsn1VR89qo3EfkImQYzQ2br4wDp5wZSDRHjvLKJehRrm4xQ5OKEa0EjtgBJQlq
	7F2mqj+gbEfBRyG07f1h+weHRQwR/KnWgqOLa6jJucOv24NDxvGNvSpjjFCeOAFQnwF2CsQqQCY
	UvKFZRoEAX5iekzZyEvm1QAzX7YjVW0/nCJ4k=
X-Received: by 2002:ac8:5fd3:0:b0:50b:4537:2e23 with SMTP id d75a77b69052e-50b80e547b3mr28682621cf.48.1774408691323;
        Tue, 24 Mar 2026 20:18:11 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:50b:4537:2e23 with SMTP id d75a77b69052e-50b80e547b3mr28682471cf.48.1774408690815;
        Tue, 24 Mar 2026 20:18:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ac1e1csm34860401fa.35.2026.03.24.20.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:18:07 -0700 (PDT)
Date: Wed, 25 Mar 2026 05:18:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <ck6uf7rleary74n4ygedm4vhrcfassej2w7p33pwft473ipjme@qtyorrhuny7j>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
 <e833f72236342a7efbce04c2109bf921f770673c@postmarketos.org>
 <vjf4lqbd5igkhvonxed3tkydxkcc5rmt2hsefng4oojrpzf3fc@a5hujilezcdy>
 <b75b4b217c2a1d1a5edefd699f0ae9966e612d64@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b75b4b217c2a1d1a5edefd699f0ae9966e612d64@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMSBTYWx0ZWRfX+uRcYBfZWtPE
 E9ly7JI1lwYW81wpD2Jh5eMjvENvJRqY676B/1DsEQFQtM1NtDlEt+Mn8lgAzvmFFykm85Q6oR/
 4VwprlRLa+Pmknjnwk58p6xAb77h1oZcXDPglsG7avJn7VfZBPThSqE1KTNL1jcedyJhyAFIYGb
 3pa8g5jogOrzl88PDeJIxqVNcJ1uYmKqJvu7cJLDoJqSV17p5Xv7lHMHhMfqbVVMbLihLrhUVZM
 NlnNphpudYPe/L15pHJ4g23NnRVjznNlJeTRKirwzpR53iAy6xrk2N5iw5Pn8Q8I5Wd7W+iCpeF
 wNB1+jgFH0gMEedYOwSnImjVmIthyi+JkDKIBjPXCG9pcE2omKg8cvz5HeeYXJeb8i2KfY+rpGa
 sXbUbv/66hazlJ713fYNGhOVrxggZ8OEJEem+OE7eanGcc3hjkJ6IgGPJEIyK7r78nLmpmXxvtE
 k8R/mRAQg1YPkvlLPng==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c353f4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=JaEu3K2U_7yi_sq1lugA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: iUFbQs9NM4T_7ReLDqzIL54tT0Rl5aQu
X-Proofpoint-GUID: iUFbQs9NM4T_7ReLDqzIL54tT0Rl5aQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250021

On Wed, Mar 25, 2026 at 02:35:33AM +0000, Paul Sajna wrote:
> March 24, 2026 at 8:55 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> 
> 
> > 
> > On Tue, Mar 24, 2026 at 04:17:09PM +0000, Paul Sajna wrote:
> > 
> > > 
> > > March 24, 2026 at 10:49 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> > >  What about the other board (judyp)?
> > >  
> > >  Konrad
> > > 
> > >  
> > >  I don't have it.
> > > 
> > You don't need it to define firmware paths.
> > 
> > -- 
> > With best wishes
> > Dmitry
> >
> 
> Should I put firmware-paths for both boards in 1 commit or 2?

Either is fine. My slight preference would be towards two commits.

-- 
With best wishes
Dmitry
