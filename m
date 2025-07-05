Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832B156237
	for <phone-devel@vger.kernel.org>; Sat,  5 Jul 2025 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730764; cv=none; b=jEYmQiPIOy+xJTlIF9PbQSzQdR1sgKOG/ThfSOcVTZnFAh52tFZ0Yi0hbibddnqMgDdt7hIaUJ/adr6txu3/3sCdRWPVkNwgjcNIYW0yck/Sab4qRFBpN8/miep9JuoyhuqKY8vBlkaHrYhODbLTodzufRQPoaFIg0P3zkR4p5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730764; c=relaxed/simple;
	bh=xhWwgrpgmcVVry6NuCIENP9udmw+xY1OYwdHA3H7Jvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=re2Cu29kCRrPyEFK2w6tY0zWy7dYSWnFlQMM9r/giXZEK4EMu0x0gmAaE0bqVIJlmC0Nq74ufEQKX1pT0HEM+99BhDOAVX0q8kVWnw59gEW3pyI2/bSYrz/SJ/Uvl8A2equqmFCIcg3MJ2qeVkf6KlcG9NsMPU7FvcLfmK8w8mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUmoXLhD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUmoXLhD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5659SEa3026382
	for <phone-devel@vger.kernel.org>; Sat, 5 Jul 2025 15:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6nEgEic99UhCA7mg8krwNctb
	NQ0OLwPSREGsrjw5rak=; b=OUmoXLhDdqoxYwgyY1EnvQq4cl2cjjaLQhkf9VSQ
	XNGK6nyfhqQFlpBC/ObNAAqcZ8bcBZx31lU49FXhX0hOl0etwCZDEZCtcOsjA+tb
	00gj9hjh/URsiSx7ASnKeC/d6qvJOdlQKCsb6StJVfmKZEZIBV95d/QAjPZu/LnG
	A2++q/h4P1QTOfsfl7yMF3nltsNGdLUFefsRrLkauBG7ZJIYqPgjc2pcG4vTaOU0
	ryuVjsdSNRPrQoOpw8zDpVIrchdzb55ISvF7sdSiF7dX9NixFACSnwcz0TkjAg9L
	ozUfTCJGIHQeo7Mbz70niKkSMdbWC17T69OLZ+fjiLqZ4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucm9gd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 05 Jul 2025 15:52:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d099c1779dso261631185a.0
        for <phone-devel@vger.kernel.org>; Sat, 05 Jul 2025 08:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751730760; x=1752335560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nEgEic99UhCA7mg8krwNctbNQ0OLwPSREGsrjw5rak=;
        b=G0HqRNC/g1Uo1bKiXStBnbma7mV2nwKIIkTlXHY744DEnvWlVDdK5KNeJg7IXFbr0T
         pNfyw0enOYrnfUq4JFxUsOa3UBtqDVOo+Fh7WxFCq855xjCbcCvsyAaGlDWD5f+sOw84
         7Qhj3gh+WZ29zL/MWvuzg6uUe8rqmOX7vj3FhDBN5KPiB9ksSwdh84PRSckpYyfRVAU1
         2EFW96/8ptKzBrPaW+c5e7CI9+z7SkNuRzu/ykkV+EfrWZwMOkYZQi5eD0FhUZyl5RQf
         /XoPJmuLzRStKUaLELnhYY0MORNw3sdd/LxvMqHYLfdfNmTWZrgcP7uUIH4m088v/flk
         e48A==
X-Forwarded-Encrypted: i=1; AJvYcCU3pM2DeaSNJgb+AIZ29uqTM2v74U2q4Rdz7Li6xLZHe3xO+QRJdElG7ZTaW2X1NZaHBBHKfWNQAN+Wrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNA4T6kdgfz/lWf/BbRpVXxz4pwCFoJeksHMkznmxQIQAkjb4G
	/F5tlRukg9aIzra7IucIcV3wPXoqGyBQJimK65oL7mrBBhKK/tNvLQNqSy74GzU2yxKSJTYFWnb
	PLmd8cgN2R55Z7juYMDtmBzWjGDVWrkwuN6DpR2PM9zGqwh1QNarNcXQ5Pwr2J61Xiw==
X-Gm-Gg: ASbGncsC5BfJLCPwSxFRD8kcoD0nWT1ro06OuVinLDMzntzY9/dC4OaxNnWet5hQCgO
	YX/o+KsRUifjVkD0/RHTgz2kHVD93+NL0C8Ysyqdh7Q1VnOiO4rd48T9rppAwKOe9pYxlW/HlTZ
	r+x4scZyRp5fw/JXVQghThIxK04yAHtTsbua3QyR6i1ThJ5W7HPQO5D+AgIXm0w7JFF5oInricC
	QwfuJ0onTvpZ0dmmpyIJ0WopA80JnrVIjtHbdP0L7jNHbct2wr0G7rzeoU9UFwGa03U0ZIsJw81
	JUPR7TaRLRl6Jj8gEr5PaVDbVj7Fpw1jVeWmWTOnjr+jiw/Qofax0bnfxCnB/kBX0bcjdju1cHq
	Mf+VY/AQlbtd+ytVqvbNeH45dzjRUcHxFvSA=
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d5dcc7603emr945852585a.11.1751730760555;
        Sat, 05 Jul 2025 08:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0YpcL5JVK8jKhh1AjM9vUcniIfH8EhFGQIv0JsaMl3Ukaei3i7V58vlU6Zg2fDsQwqQTfEg==
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d5dcc7603emr945849885a.11.1751730760115;
        Sat, 05 Jul 2025 08:52:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7272sm604713e87.196.2025.07.05.08.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 08:52:39 -0700 (PDT)
Date: Sat, 5 Jul 2025 18:52:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Start using rpmpd for power domains on MSM8974
Message-ID: <yjz3rxpwgl5u2cmgs3yf3qhkbpflo455pewbkgxe62qp5jjaim@5xpinflzvflc>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <amfgwjgstu4hoxz4lo7fqrqz5fqtf3r7o6wqvrrjkcfubwrjyz@5i75peprq3wn>
 <841c41cc-e44d-40c7-9431-a77feaa49b05@lucaweiss.eu>
 <225b94a0-eea5-4061-aebd-da497d349527@oss.qualcomm.com>
 <2e338f72-c676-425c-a96b-1cfed466f9fc@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e338f72-c676-425c-a96b-1cfed466f9fc@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=68694a49 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=26E2V3-60KTWSeZm1QEA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iL-yqTEdO2E0VqrXYxCCLZ293S_BJQmF
X-Proofpoint-ORIG-GUID: iL-yqTEdO2E0VqrXYxCCLZ293S_BJQmF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNCBTYWx0ZWRfX84EZlzC1wqEQ
 4mpDyNAS/QLqSKgqqXtPJlqp+BVZusUkh/JUBzt6goDxohih09WTcf0yVV57vXLPH3Kz9JlPNPj
 D/gNG9GZDICdcGpdYPfyc85G4dkSE6dtVSlxSp0JNAW6XYp6Rh3PDdCHFWK2NdLjPwchrjGqQ7H
 GonD898ccpZu5oziIzvrxS+sLt72a+/VTzL7+NVhrUBGWonPdbVaU7SO2VMBSKUjRHpWr+3dDPV
 u0o3lkv+C+pMLWDXidOf4uBU15sW5bTD5kp6DeIBE7HELnKCbSQVj1BWonkwFcr0pk8EOZHDJ5v
 taE+LJdmOHEecsJi2ACdVMEkUvntaX3KqCIil9im2o60WbtPDAQgBEvd38PbTa4+Iuy9o4Njo8D
 ETuWUoXYrdQYOIzBhffX5qKptqi+9EjiFgiAdUuHH5pBCn2SVnEEdE14ANxJ03mHAdwbLdAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050104

On Sat, Jul 05, 2025 at 04:16:44PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> On 24-06-2025 11:03 p.m., Dmitry Baryshkov wrote:
> > On 24/06/2025 21:46, Luca Weiss wrote:
> > > Hi Dmitry,
> > > 
> > > On 24-06-2025 2:59 a.m., Dmitry Baryshkov wrote:
> > > > On Sat, Jun 21, 2025 at 03:19:55PM +0200, Luca Weiss wrote:
> > > > > Switch over the ADSP PIL to use power-domains instead of a regulator,
> > > > > and have one commit switching over the MSM8974 SoC plus all the devices
> > > > > to use power-domains.
> > > > > 
> > > > > Note, that I'm aware that these changes are not backwards
> > > > > compatible and
> > > > > not really bisectable, but since it only affects the ADSP on these
> > > > 
> > > > Why? The cx-supply is handled unconditionally. A single-domain usecase
> > > > is also handled via a special code path. I think this might be
> > > > backwards-compatible, by the pure luck.
> > > 
> > > Honestly I have not tried and not looked much. I mostly added this
> > > paragraph to avoid the response that this change might break and is
> > > not really backwards compatible. If it does (by accident) work with
> > > the updated dts without the driver and the other way around, then
> > > even better.
> > 
> > I think it's worth checking that new kernel works with older DTS (that's
> > the usual rule). The platform doesn't have many users upstream, but I
> > think it has been used by some PmOS users, which might mean not-yet-
> > upstreamed DT.
> 
> I was finally able to test this, but the patches except the dts patch does
> not work.
> 
> [  170.802573] qcom_q6v5_pas fe200000.remoteproc: probe with driver
> qcom_q6v5_pas failed with error -61
> [  170.803127] remoteproc remoteproc0: releasing adsp
> 
> I didn't take much more of a look but probably adsp_pds_attach fails there.
> 
> For postmarketOS users, all msm8974 mainline devices that are packaged as
> part of postmarketOS, come from the github.com/msm8974-mainline/linux fork,
> which included this patch already since a few releases. I'm taking care that
> all out-of-tree dts that are in that repo are updated.
> 
> Fortunately this is just breaking adsp probe, bootup still works as before.
> So from my side again: I think it's not worth the effort to add a bunch of
> complexity to the driver code and support this use case. I'm not aware of
> any msm8974 upstream users that would require that.

Ack.

For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
