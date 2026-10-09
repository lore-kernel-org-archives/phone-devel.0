Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB2F4DA9D6
	for <phone-devel@vger.kernel.org>; Fri,  9 Oct 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551906; cv=none; b=ra6ca7N/yzJ5dCM5J1iX2vsG8zAPvOEP+q7FinrhHagNtC0A9Qr4FmkzcblQ9KQOECycz7wtP2XGpVDn+71jfWPfBmajpPFwAVXTOpArZt/BlrXzzdTGJZsqEDNq1mAPYVQ69rwQVi2YxjAczu9Uehr04T4WktZPQUjsyXd1OLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551906; c=relaxed/simple;
	bh=35owgoMuwrrGhU1IN3tED+EYAqd8IALpPDCTSNeIVXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaBHTUEBPZxRnB2dfBEivoWhFsJq5EpYfOsjyBNvWzzdIe7UmFji8H59BVQINOAouc4YV3nBZ1C6FCYglxqYzuJEYwixq1vpgfXJuldBM1ghxWUYLzLAonU747R5oWf5aAJEwggm3YJBWo56ll3oIjlwLD0yPLlyKsp4yPHePxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZ6qkEpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LabpTZho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZ6qkEpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LabpTZho"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KGrf230888
	for <phone-devel@vger.kernel.org>; Fri, 9 Oct 2026 13:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qYYBr2BmdY4zOcF4U3A9MMVD
	JkUDAoza8jdCzVd87J8=; b=gZ6qkEpN/3z0dp4iU/6TBh+4OpMelin21NOP/SRx
	MNxj7f9rZy6MhtORC7OPNIKpz0JZHg1I9i3mtUqbFcWTJLHI7Ojsva5tvjyY5YYe
	Lb673H5g63L1jckeq5bpK4hyA+XyP7tRAflWpb/Y71vJBHMrIc7SMehyyJEvBLZs
	Bpe6xluCmmAjxK7RFkfekuRVqoY1UDIk/2xSvobcp5PCmJ7jC8XP8VmxbWpeNcAX
	e3SSyS/PTEE49G1VR/8XR/5vL+X+sx7n8Uz6ekGflQa94kdQ005deNVvhvkg5/Jn
	ZOrVGikNdxHVoM4cJnL8E925DFF8Y9Fx5bbR+Jw66l+0QA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu3n2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 09 Oct 2026 13:18:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso1243443885a.2
        for <phone-devel@vger.kernel.org>; Fri, 09 Oct 2026 06:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551902; x=1792156702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYYBr2BmdY4zOcF4U3A9MMVDJkUDAoza8jdCzVd87J8=;
        b=LabpTZhoIoMEjsMLcxGlMQ9d0VSJRd34LHbzVo64uUavhPpEBAcvfOcZPM2o48P0G+
         RqbU/Z4z4999j6Z5DpTv5vs8iLO425chbW4xPGn0VxUc8aeFVNHEcTnKBkdK9lMFffm+
         qV2FQWVOaSo4m1Ho2GOK6UyE1m9v6EgQRmgWLx+a4p6hHf6fQANlKesOoCzG/Opc9I0G
         m/COS17MgQ8cC45JA9ydbn90k6UBUv7zUb0pnpUiu5SwpWtbHvrvFarJI/Y9BSXIcVEa
         KOky8b+IZfKYy5dZ/L9U9d+hu3aanePPtQPNuZRLWgMzERMUX94th8y6U+UXOzblry6O
         pLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551902; x=1792156702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYYBr2BmdY4zOcF4U3A9MMVDJkUDAoza8jdCzVd87J8=;
        b=rEcoa8w9ffLHthP0q3n2qU+ZxviRi3hq7cG9RWGhqC6Kp0CWHXDpVEMIL3nBn2RY/p
         PyihnTviMmDFDJd5/KDWEZXYTl/Az/cdsQLks5w11B5WOerbodTbzTCIZEwv/N7KU6CD
         sNQzpTVMlNzYG95NAMtJ7JlDtquAAC13Je//Z4bF7wLXWrFLrZUL8DuN0cJJ7u1GmEji
         Su1NNHXK0D6Jw142oC9CaHzQSYKAhz1sL8xhhjB98CCHRb+v3nF1HQEZQxnHj+zhvgqv
         niXCk+Ao4lp+KrCujOkw1D+ioPZ6V+/vGdMbn0Uy0MoUgelj/Hwb/Kc8KDGdyOsRmHFu
         7lXA==
X-Forwarded-Encrypted: i=1; AKwUvBzkBoZF0mlofvwgLV+K5hmCxOAhUHKN4Ox2/Kfy3YhyJJ1OAQ1ShqVZGlIbL9APvaSykKYPe0r74WvxYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUI6AAM/PoqOSYSu/z8zZNvVNHnUUaqtHt4yNkUVAbrpUVvXWz
	mRbq3YLFtfuPh61YGOIdrnGQF9UNSZOP/CkoitAJoxe4jeLnWaJCK5u+qkNBDwC4QiHF0ro7zOl
	VcDI7wS+HjxU3TNb5E1UxVtrvfNCvEaEAoUtVdPAZu3pVLpDVfowKqGnCL3OVlL4Kxg==
X-Gm-Gg: AYBFou1adOH6yYyy2hRaPGKIGD52T3j+OQqNR2YPEv4A5T/smq85MCh0Mb+cJRxw/rQ
	LclslseXPJm4NK8F0T/DMhRsZPVF15G3wUocNF9yC1bKSG8/CJSMpcvUlVyn5e+NmceuZgYwWKM
	Dm+kzmeXQqtBHhVmAnshqVd5qAU4MW4nJOzqK3tEBw0ukNGtOaMClmLvjYXiRII/c3SqK72PVI5
	sv/WoOuyo3pX9KutIpIIPazUkhS5aulj6VnI2h1/L6Qm3d4njWhEPcmHBUmgYFACOq5uUeGkUQ2
	nbb5GajZ36G38EIXXC4/chMvWKgkVOfe85s6wWlBuSPCg4GoC0r6MofSCjSkPuVB+HmcwLyXtZx
	EWkXBcMcwv4QIs3Rkgx+JMzE+KNVbffgSrDoH3pIu500afO3T3NJcMGN+8IbG8RY81jOT4VW8ws
	tZJhPDKqCuHUaG
X-Received: by 2002:a05:620a:2951:b0:93e:6da8:6cde with SMTP id af79cd13be357-93ebd207afcmr247614885a.35.1791551902212;
        Fri, 09 Oct 2026 06:18:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:93e:6da8:6cde with SMTP id af79cd13be357-93ebd207afcmr247608285a.35.1791551901630;
        Fri, 09 Oct 2026 06:18:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd5d8fsm5986561fa.30.2026.10.09.06.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:18:20 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:18:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/4] drm/panel: Add driver for Novatek NT37705 panel
Message-ID: <xwaxsqtffljmv2tgobybq2f5v23hs26wy5zjdti3dziu62kq6z@qpzlpnmplnwp>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
 <20261009-fp6-panel-v4-2-7c3819664778@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-fp6-panel-v4-2-7c3819664778@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX75hqd5lJQvFC
 enKljNVa/sQeIxQm02PmUSGQD+Cu+CKXhYU+lEVma/dAsQEF3nkvwo5eGEOPHd+AYKyvf7kW7k7
 ohWI4tGxfya0UQoT3FWVWcCb6zCZvi0/UCR7yWcVrdX+FlWB9D/1OyYFuOAZVorsCsW4U6THdTK
 FA+JXaqPE1rojGJYS+50iTk8114Df3FBYbXb7KAL2+yd8BF997FgvmokbPQy1VOH+l8jDYTsTaD
 lF+zBHBeWCh/PP+e980vhkIHst5t1cO4srs64yPaEYdzJaNZ++2mnJAGTCxwSwgcpbVxccYFtxh
 JI090h6Qm4G6MMkVbvB90rSB7v2201O+0IyNSfoN1TDIOgGCPcznr/c4QLZyP7uk4ShJKihrWn6
 8DkEHnqtUZqlJytQ/UkPqcf40GyN/wHH7h7sEPh/Trv47lmgD7jKxyBWwxB5tTy/EQtfoWgC/ZP
 OsCsqDAxnZgls5QJ+3Q==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8e99e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=qNtwOHy-hT8K20Jd0IMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: uXpW6C7Jqi7ISLcF40wQxqqekvsfkcSD
X-Proofpoint-ORIG-GUID: uXpW6C7Jqi7ISLcF40wQxqqekvsfkcSD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfXwwnrRMmdJfdJ
 xh6uqCHqKn6w9wEeGlseFFKkwujuMLitNT2IiDh+svyU5lzkzThO4wPHeRSAXTbFSEsuyl0h7aV
 JqmkNA/IW/3SKku7mkRhKlSVzfjNbHY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

On Fri, Oct 09, 2026 at 01:25:01PM +0200, Luca Weiss wrote:
> Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
> bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
> smartphone.
> 
> The panel can also be configured in 10-bit (RGB101010) mode, however
> currently it's configured in 8-bit (RGB888) since there's some issues in
> the Qualcomm DPU driver when driving this panel in 10-bit.

I hoped that fixed all of them...

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  12 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt37705.c | 396 ++++++++++++++++++++++++++
>  3 files changed, 409 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I went through Sashiko comments, I don't think that this driver diverges
from any other panel driver.

-- 
With best wishes
Dmitry
