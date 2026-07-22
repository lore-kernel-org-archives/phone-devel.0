Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873A92E738A
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 05:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698480; cv=none; b=nPmcTcc3WQJjq1uhO2mFRw4kzhvaUbKTf2LBHY86iDjvmfadcXjTmjH1zq4B8kjP6DWeJ4+ntU2FZZ02nIlhNZBWHh6uNniCoTZTFuZ9Tn1fJU7PH5Zv+pNJUnyG6SHAegqH/wWMCsuPoNc6ph0lRMtU4PSu8WLmvO3LzKTtLmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698480; c=relaxed/simple;
	bh=6ycv7astDcTJCQpxuZDsd0xBaS3f+UykZrQHeKn1rz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3cNPqEfmSy+9UCYYzsw1zlx4XMmvatX73bUyR8/Eljwv76gm3DP5Fv/bz7Tpyzlt+uwmmqfbozRI6IEez7zmRPZ8jMHt1OCVzSseBWFve78SxfTncAXybS0yCJPCGA8UAtHj9K1rfL89nWhSpf2oMohYycrjygYUjnSCl/QYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkGF3nnT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdl/YOew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkGF3nnT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdl/YOew"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53fVP4027262
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 05:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LlODXpltO6AC6vP+2wHe+ho0
	iSx/n3O4fHPoL+am4BI=; b=PkGF3nnTMXSZbEDIS67EgQ3Ju9wfrK4dgBljVKAN
	S2LzcUV3M/0dmEcrMGDoQtB3tycAJ6Iequzmu3M7d2qXbz+nLHQKArx6uebLKnky
	qZvveDX0gdKmjHsI9XgRx1ljL7MgYt5A5pWGWiYGBbvcEaoBikvkTkrgLTRq+gZv
	xYBFZ2AWafXlVNJ/neWaFDuAqqtB03nZlQsJduV/J3DpIIgc8MT4B/yj3jiV9yFl
	Jm87iJkJc5AODztmeOO+k+zpHQJ/nztDQH1npou4xur9nuUkgcCAlPSMCN+zmN/H
	dZEicrQysRPK7cTFpxEKj1Q13r9KnnlfY6/dYWspNbBHPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsbng4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 05:34:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so249512871cf.1
        for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 22:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784698478; x=1785303278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LlODXpltO6AC6vP+2wHe+ho0iSx/n3O4fHPoL+am4BI=;
        b=hdl/YOewOwAF10r4l5d2OUmiv+jCCGh5zBC06NK/ajvpKtRunV3oIRjfg7wCyDCIRn
         nxje8vJxAg2mX1Y3t6ZPEFS0lRNJJjyIN4whO/25DZinNUREkksdlv26im9WdEwrzepv
         MIpyr3jIkaNGixPPMmt62InowRHqSKq/q1Y4ou/vLjqr3T2tsIPEoszHwVLm1AikW5tj
         GqgKIqJ0XYdgCzzFiGSAbrUn7Ek5gFRxWhXh8xMJqap5GiKwF59QRVYiPXsfOGZbM32G
         ZU1JPd7GKFNgAYUTm7UgQz9aTL4+lbi/BQuJb5/Ptrl4AI00vJCd26q/jc7RtvKR6gc4
         kwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784698478; x=1785303278;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlODXpltO6AC6vP+2wHe+ho0iSx/n3O4fHPoL+am4BI=;
        b=jZAUJJIDgyX6+9axsBeGixrFccNzJqYXkUQDIp+Ejx9AsnVJDLoxO7KUki6z6kfmIf
         GcDvGEWO61dZPO+a2KhY8HLR0s/vd6R4siQ3qcQntqoU6UMYLmPYfHGebSETOhPlt/un
         nd2QJc+jWUMJdDK9YXtTwvHFQEf7TEMmTaI0URKspk2eg91yYWDP+WMPpZXKzO5X+ZYO
         +PIKN6kyPtE52SzzL08n8n+euYdfhCObUBUw4G+GlInFC8SrJiZYPfF93pNGHsZCqupN
         KfB55djIYrGwcJ7zAaJ3pE6QuAna0wn2tStaDeatZBG+ELpFWLtoT1XxSM+q/TEX/chK
         teng==
X-Forwarded-Encrypted: i=1; AHgh+Ro70AeTba27k23FOs1x46H7Xci1UY2ZhozawpdZNcWYdQjYXcLn9QMUBcwZ7bene+S9QRnTEHVn0+bqAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOhqUsTBMWGnaY3m+DKLU6hJMGX7W0GjwZ9Hw2sZv0T6gpV+Qm
	mnEWmR9hPYqsi4mZ6e+UJ++0GeJVevgVx3IeY4hQ2WAjN7hRJry/p/jI45/t+tU+TcPQaEL091l
	uHIYb7HY1h7p1i86IVMoyC+K/9um1JqDFNzjeardLQGTODaiYoRYT92l1ewRzEQpbfQ==
X-Gm-Gg: AR+sD12+cnRGu/1Gw8aPRMjcrFmdzxdJd3gxyjzsr5lvoDFv1r1UQ6oyEIiLEczLPHl
	aO1SzVtFi4gSw0/PJhOi/S1wXWBg6nWQSq0sukPw+bfnUeKBKSFNvNNjp/Mbr9wLGn7ndH0xwwv
	oUd5e+5FPOZRiJjCy1Gdg76NTn7VTz9o5yqvyqtePkG42kSlnHrEKQ7ZaIvdLUG/OgnQxLFP9dY
	RqI34GauHwr+Yc7qMzL7E1MgPeL/2c2JEG5OoU+Io9L7ofIw7PDsM2TdV0EcsZbwl0CRWLXmuu6
	3DwFMP7lPAghVTW8SdVaV3yZIpI3siUJtbWXt+FQdasiuranyicVl3bHijHk5/dwrDwbit7OPVJ
	V/CsV6rRjv12OrW9sfijS9NIoWZC4TZkkRwQNjs+YxS7PkH4foG/2qDBtLytyBFYQwyMttFmNPY
	vTvAZCexIdkWKM0w==
X-Received: by 2002:a05:622a:15c2:b0:51c:7b12:5ffa with SMTP id d75a77b69052e-5213d7ac3d7mr204182261cf.86.1784698477674;
        Tue, 21 Jul 2026 22:34:37 -0700 (PDT)
X-Received: by 2002:a05:622a:15c2:b0:51c:7b12:5ffa with SMTP id d75a77b69052e-5213d7ac3d7mr204182071cf.86.1784698477258;
        Tue, 21 Jul 2026 22:34:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d30758sm276826e87.45.2026.07.21.22.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:34:34 -0700 (PDT)
Date: Wed, 22 Jul 2026 08:34:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in
 qmp_v6_dp_serdes_tbl structs
Message-ID: <zd5wulhfcw7vzbwaz4akhetbqqub7ygsmexuswkdvzxcfmqvqa@hom4ax54efft>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
 <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af>
 <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me>
 <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk>
 <47b1db2c-6314-49ce-a7b9-f68eeb022295@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47b1db2c-6314-49ce-a7b9-f68eeb022295@proton.me>
X-Proofpoint-ORIG-GUID: U5-rgo8KvsT9q5hm6d7f7PSuiij7Y3ix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0OCBTYWx0ZWRfX+D/lZRjdVSpL
 zKpSd10M4j/XjWildOKRvsTe+Kanpv5Oeww6EizEAcSKwP5C6EO5V0jZiNRj02FMTanM7EHi+WQ
 oCbY+2aNTv83lpDg3/O2vAmUGhjjQmpYSDT52viG2ZkoYoFRuvEM1UNZvA+1UisXSDQWfaWE4gq
 OOZytM+kotgDG9d6apOKtBdvVjyagJ2d7rhBRAzQrdvED/3mNzUDmWuWyoMccn0ZsunT+GA3fia
 iSLiMqVQHz0/L4yX2zPBLOS5mzjksJgq+Kj2MTyMrXyf4CfvtgPIXI0jlkfvZldaMC5Y2NnB41n
 oAxOKAvv8bOURU6sko4rDmxvulnsFXfEkfo9iH1YHwgPhF2NRN4SvtmDEYncNexb4TDsCA9l5Sp
 bCbr8g+X+tQGrtVPj5dQ9t0LEHuOkaYUJwH/dnCiBJwltu5ggBfpwO3qJp2F0MlN4uJNlyRrDuo
 JjVOhjVPTXOyiwXxGiw==
X-Proofpoint-GUID: U5-rgo8KvsT9q5hm6d7f7PSuiij7Y3ix
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0OCBTYWx0ZWRfX9pPddn/jshTT
 vc/1gBFPQ0p91YfLy0w4entUUmAT9BUBM++yE2l1eLwH1WHw9ICDVP2Tj7o/em3CY3CqbGn/s2o
 DEG0AynHsN54FgM5G7YTbg045C/HtfM=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a60566e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=fY_eGrlidOvAcYwQiNEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220048

On Wed, Jul 22, 2026 at 01:02:40AM +0000, Esteban Urrutia wrote:
> On 7/21/26 8:35 PM, Dmitry Baryshkov wrote:
> > Quoting commit b5383dbae381 ("disp: msm: dp: add pll params table for
> > 4nm PHY pll settings") from the SDE driver:
> >
> >     Because of changes to ref clock frequency, few of the pll
> >     reg values are different for kalama compared to palima.
> >     This change differentiates between these two 4nm versions,
> >     based on pll revision and also introduces a pll reg table
> >     to differentiate the values.
> >> So, I assume, that v1 vs v1.1 is a clumsy downstream way to specify the
> > ref clock differences (which affect those tables).
> 
> This does not seem to be the case...
> When HBR2 is used over a direct Type-C to Type-C DP Alt Mode connection,
> link training fails when v1.1 tables are used instead:

Yes, because the platform has different refclock.

> 
> Jul 21 20:56:39 esteuwu-phone kernel: [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* max v_level reached
> Jul 21 20:56:39 esteuwu-phone kernel: [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link training #1 on phy 0 failed. ret=-11
> Jul 21 20:56:39 esteuwu-phone kernel: [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link training on sink failed. ret=-11
> Jul 21 20:56:39 esteuwu-phone kernel: [drm:msm_dp_bridge_atomic_enable [msm]] *ERROR* Failed link training (rc=-104)
> Jul 21 20:56:39 esteuwu-phone kernel: [drm:dpu_encoder_phys_vid_wait_for_commit_done:545] [dpu error]vblank timeout: a0821300
> Jul 21 20:56:39 esteuwu-phone kernel: [drm:dpu_kms_wait_for_commit_done:527] [dpu error]wait for commit done returned -110
> Jul 21 20:56:39 esteuwu-phone kernel: [drm:dpu_encoder_frame_done_timeout:2731] [dpu error]enc37 frame done timeout
>  
> > I'd suggest adding the comments about 4nm-v1 vs 4nm-v1.1 rather than
> > renaming the structs.
> Regards,
> Esteban
> 

-- 
With best wishes
Dmitry
