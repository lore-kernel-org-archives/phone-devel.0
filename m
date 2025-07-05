Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7182E213253
	for <phone-devel@vger.kernel.org>; Sat,  5 Jul 2025 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751749043; cv=none; b=p0Tm1J+P2eNi4qsM87EVF2+/TGRh9yHxY1s258IKjnKBzGrvx93BhwDT4VfuqtcRUVo/4xwKdTpA1GseYX0JLnTxWW1dqAKsvs6v+ap3D6dvFFg2BAlxsF1zTh0U7eYIjZNbKbPgeGKf7vThzahrQwpKT2gURvYlf6+9c2K4PKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751749043; c=relaxed/simple;
	bh=yd3QB9i6892Oi/RELZQPA7eTy1+ck7mvWaDjNXHvHaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDUh8ZzhQy1SBxVb9puhu7adBshYkm8XATQvFohwjhdrEhGsVEiefwSMxmCbrd/WHNvJCp7lOnmtBUP5VTEBzmJU3580HYZqkCSj3PZ/riScpaPV3M8fY42/SmlNV11F8hrUhL/JtCwrdrjET8prlghdrYo5f9ES1Jzv+CrClVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElYaW0ug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElYaW0ug"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565JtWo1003559
	for <phone-devel@vger.kernel.org>; Sat, 5 Jul 2025 20:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ixkjiJJ5xJZnwXwbUy5Cg/AO
	bRkh+NRxwTSQlLi8b1c=; b=ElYaW0ug6LU0UeA2xfo0yGyIvfeLfPCN7rTkYyhb
	ZYFBtjWrj4+qPIfe+3wx3aDg3IwmwrOVgGHEeFA2stdx4Wo9EC2/JHd9bdcOL1+A
	NLd8cC/rrXyDIVVxTbi03o3+B5+nwRa3Y9fg5Adw83+ZfPYu2BCKSpGn9VS16mjI
	bYIM6lpbrvzryEnKquVFG+c5GFgYeEshxd4qEdkeShd82VqXZdREUA7V+nk/DJi0
	uzr61JCebhW9udhyFfXviCWrkduuMfxJQ2qRqcZ3amavnvm9p5tLGvKLh1OPFGVf
	EaqJO2k3bKAxt9hTG5D7GR+47BDd0rqIlF7Z2txQymKX6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xa3qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 05 Jul 2025 20:57:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d15c975968so321014485a.2
        for <phone-devel@vger.kernel.org>; Sat, 05 Jul 2025 13:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751749039; x=1752353839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixkjiJJ5xJZnwXwbUy5Cg/AObRkh+NRxwTSQlLi8b1c=;
        b=C9oM70V1dg8RXrpQfS0y1C0SZJnlUi9371TBJgNenEeobTM77PJnBE0WXKMLCtQEyx
         VRqF0h5cIi5xKQ3u3jWSB6OY3SMJN2UTlpFg+QxIVfsFsE+Q/DzOHF7xlWikH0pE1/n/
         3jFZj/6OXrIMiYnChXlTWfMtU003DVcKSB/Pc04HpnlQdLoqzokUzOSM1Ci6ApS+dYGD
         Jr+YIsiDfW7s7m71IQKEKRsdISovR7gnRIbiQ62UR3Qi7K4e1tBb3qfA7zSpTeHNpp6y
         fXKA2CYhiEOtFFffo38ufgAecMeJP8p7HH9w8rpdSQi+u03UveMLK1f6BPXP+2tDlCVQ
         E7uA==
X-Forwarded-Encrypted: i=1; AJvYcCU1aXyRBlKOneRAB6em0e7H0Q0M2sVGwCUkRwC1nt7a0zsh5Q2SitOxVgUXdcaAkQCoaIGqfC5Fl0G30g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeoQ3bVFgdECue/GVZ+ad6TW+JmVW0HP5WFmW/ZqI6N9JlRG/G
	WuOKx+QBASUhx+xODb/MCNxqE2xC/okY1TeUtCs4XObeG9crcJQ7nmN1fsIQUbyVUOSeHomMNJq
	fdzoyVHiGE5LZ8VUdStK0a8LDJ/WPYixPrQDWZi4B2sXfBFqJ1564r0V17VnZRTxKng==
X-Gm-Gg: ASbGnct2gpk9zg79p3GBsLVUIQbbU47+a6ysrBY1XRn+qA7FNCelec9zePOWZilWgU6
	PBH6AaPt6rZqIgdN3DUaEtWk+ttZky2vf9oNnF2Wn0swzxyQRrNFLlnzG4aSKv2TZyebhMeVwjl
	ZYXWkjMZ1H2s6XT48JLGGyAyHrvXmhyT+Ftf3uzm71RWzr2a+rSvP2X26+4SOgiZb1m4r+NG6Mp
	SWd0z0o6gnqDV3WZwEA6KkKRZKBE3PkNAhF9im6omEd4AgU8p6e+epQvGNSiifuZspaCFra2pas
	WzLlyNFwLd6TB7fbmWN62Y79IQw5UvfXAoDu4aqdDrTUOj16lMueFZaXzm8eidlr559Ipumfv/D
	rg26+qoc/RsW+HJ9oiQh0AH3srUdaqUCue2I=
X-Received: by 2002:a05:620a:178f:b0:7d0:97a6:4539 with SMTP id af79cd13be357-7d5df10425dmr744839785a.4.1751749039450;
        Sat, 05 Jul 2025 13:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM59TkO8u8/py6MOdyXPISy6kh3KQYZz44Fii7ZoY06xkcbs1OMh+BhhFj9MBNEaem6Skz6w==
X-Received: by 2002:a05:620a:178f:b0:7d0:97a6:4539 with SMTP id af79cd13be357-7d5df10425dmr744838785a.4.1751749039059;
        Sat, 05 Jul 2025 13:57:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383babd6sm705164e87.32.2025.07.05.13.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 13:57:18 -0700 (PDT)
Date: Sat, 5 Jul 2025 23:57:16 +0300
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
Subject: Re: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8974
Message-ID: <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEzOSBTYWx0ZWRfX/LY969SNZ4df
 QMA6RzVW5jnZiMuYRVHvMjK2Q94baZ9sGDl5/B7X5SaTzlLvEywyG1KR36K83U7oHx3xcqcShsf
 5zhDjUBpYcPzXx5DzImnGfvO2DllmKvNcpAy4HSQCeC4bpbHn34xtNzstITKSBh/0qFpLh+pg6B
 fSh9+W69stSMxvnpg0TtItBgnM+cbjbouivALR9UIuuhiKEpVWieOc4AZ992/mQPo22kl6YgSCC
 YyRjA7bohvKB0HHvav59ZePmlmyTVqxvzfhjvGriA2UA3RB/Cxd5qc7fx2YeNi7l0N2wqr9rGkk
 RR73RjXx5MP1QcMa5ZrDpqtJ5cxxHI8hxHweQe65BiK9VI3i/wXJGUqQ3rwl2p0/DEPjwgQS/lS
 gwP0P9hhv6Y5YsoeiNE4Aku16DB9pV3q25m+vgfPqteup3OL0uiPA2RGjjjoxq3i5YlJVIob
X-Proofpoint-ORIG-GUID: kCZD4fsiM6IE774frLV9MwdICecuwpAu
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686991b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=dlmhaOwlAAAA:8 a=l10-tqhT6-g9Bduh0oQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: kCZD4fsiM6IE774frLV9MwdICecuwpAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=965 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050139

On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
> MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
> which has cx under proxy_pd_names and is otherwise equivalent.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hmm. You are modifying the ADSP configuration in the driver, but at the
same time you've dropped CX supply from the MSS remoteproc.

-- 
With best wishes
Dmitry
