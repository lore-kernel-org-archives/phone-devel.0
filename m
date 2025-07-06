Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE962153CE
	for <phone-devel@vger.kernel.org>; Sun,  6 Jul 2025 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751807835; cv=none; b=sX84eArepSh2JshHBsOTGBL5D+lYCDR4hfTgSDJPDgzWZTegJt2GHUU4NNlYVx2WRnpr3Usz4IxGA0j238ZId/xPamrpHvIUp90t/nlsnBFLkysQXYn9AEvEqh/OONGDrDFfs0v5sBqgO7czs9TiyxaU7GLvTfvY/hAVZJQWUPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751807835; c=relaxed/simple;
	bh=qTTz9nPQxiJwRdpENmjn6LsyPlXW15ajO1SLMCtaUMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/CbxERZp0ZKiaj+R2Kuk7V6BMW2uxkYZEQYOLw+VsCEqC/OHyl4hTXIAx6lVJHZdgvXqWTHjY3cp4JyB62KjNGtFmMEMERqXr++eV94a2p6YvM9NmCJbDovDzsy/h06z4J/nXKSKminqFGn9RYrG6sLqGRDJAEJfk255hK0l4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfFVCm3b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfFVCm3b"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566CWe7t021118
	for <phone-devel@vger.kernel.org>; Sun, 6 Jul 2025 13:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EMu8D2urkSnttwu+eBSYfOFZ
	ChWl6OEMNQLTQc/BZm4=; b=NfFVCm3bAqCLeEFx8tbQdxy5LMQbfjsyd3BCCTIW
	57n4/QGTnma2PdGDKa9w1yxSV0eIvEHgudsaXT2ewHe9xxw5gRVMN5tSIlN2bhCs
	4vK3VIzN0LtBHUn2Fi7rtYsiBjao5MRw6wIIvTA+lmlMPaY0c80OsmuMtYSZfg/x
	PmAMPoMuKxpFb1lNAfF5xY7y8jhLHDjiCSYOQqgZxe0ct5BBGht1bg0m+FUi53IZ
	SXycJgGYJBDLOq+5NUxQjrFH+Yu3dW++5cXHFa5pE1YOscADutgMELLXCkRcVp+X
	NiQIxB1WuiuTbH8LJkfz6Tn0+DWgFfy+g/aXZQ3NWYOmXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2amh88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 06 Jul 2025 13:17:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso328237185a.2
        for <phone-devel@vger.kernel.org>; Sun, 06 Jul 2025 06:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751807831; x=1752412631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMu8D2urkSnttwu+eBSYfOFZChWl6OEMNQLTQc/BZm4=;
        b=lJT0JfNY+gC9oK0Kp1hf9ZY4wgQXbna0puizOwW3kjOXBX8UX5KRIFQofNPmSi+dYs
         tV3efAvDI5IvsrNkV1JlVZY4k4IYwrE4Em0TlcQ4D+L5jHEldrbr+Ty82nEQjWdViMpP
         6tlquiepxsYP8jMp1wEFz15jBQJ5HACr8NOTjJPUKoqDHPqIiaN487NNgy6UCbaFRrb6
         ZOVKVJ1TK3K2QA+aNveqYuajjPUDlDTfvHUm0sFNnu4XymdanQ+/plVbEwNgutdAcp0+
         7As461dew8Zn1e528lYfAwLvTNz9c77pwBDDOxDiUHZVacZOdgyZ3FGXdVfw8EDY5Lk8
         lIeA==
X-Forwarded-Encrypted: i=1; AJvYcCX9iJv8ch6a8iGYjCaAx90dy944Sb1HTz/Lg1gaiJDF/FU8AGEsxJBPhHcmms1ssPJb6tLXAbkeTZMcAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNihrjqTOxloTs0Vgiiy6iAOD2SlBD9bUDGp5jFJtN35Tl4jR3
	sLRCsDTASs5eDxbB3TIAT7BD7O/+HmIiGpJa1mWIux56slUXk6V7uN8MfpAS9sdn8YVxj2WNOBz
	Kr8/RR9dApvIte0SsSjD+RpnTyM/NppI0qP9C9LF5SBkM4BlFpPCReyYFpCVtjbDlRQ==
X-Gm-Gg: ASbGnctTMXcL0iqold/B+hQy0WgTfj+FJZ1hakaC/587ENOR6YYvzNgIBSNZJxSasfq
	ZJ0EXaR5Kw6yjPqlIc+yo69eRCuIfit585neg29kz2BL/1n9YNc+zYXQg6j3avGQmZeUmMUIve3
	btUl4AV5RY8XqP3Qdjvun8x+ky57gvU4hMpQ8dOmjazVNm8vgXC/Adw0WWge1oGTvOuHD9v6o1C
	VftVteKST8LF+J8JIgCcuR4zbFw10XDM6t9mU5bIlT6hg5uNI2MsqGUZudEEa7Xn1uWFm/+r6uT
	cFNLYOqTJ641b13THRDDRjraycIUHOr9Y0ruHdkJ6SACF+JPIUBY8++n05DplwtkK6b7PBCOXVk
	wzNvwrtE5vJ49f76GkRBq5+Qmbg+Yr+Q+lKs=
X-Received: by 2002:a05:620a:404e:b0:7d0:9505:1797 with SMTP id af79cd13be357-7d5f0a3bb12mr606566285a.4.1751807831275;
        Sun, 06 Jul 2025 06:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2HuT065tZ8I8BaaCuYfsYtZ4vVgMbrvNo6D9ps+z/dQZyU/3GSde1crlgPLIHhFHrrRmZ1Q==
X-Received: by 2002:a05:620a:404e:b0:7d0:9505:1797 with SMTP id af79cd13be357-7d5f0a3bb12mr606562385a.4.1751807830714;
        Sun, 06 Jul 2025 06:17:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494d37sm953233e87.117.2025.07.06.06.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 06:17:09 -0700 (PDT)
Date: Sun, 6 Jul 2025 16:17:08 +0300
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
Message-ID: <huvsqr3hxkeerjevhvjobfyxzfjldoawlgj6xgmdgf27kwbea4@ijh6gqbsa35i>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
 <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
 <226fd16c-8071-43c7-9ecc-9bd95e319aaf@lucaweiss.eu>
 <znv7ish4ufkgnzfwyxjt2ercdvemxh644zwpqthj7rtf5gb4fe@auvbeemdlbtk>
 <6733d2ca-f73b-4332-97c3-ba79377538c2@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6733d2ca-f73b-4332-97c3-ba79377538c2@lucaweiss.eu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA4NCBTYWx0ZWRfXzVsMW4trr4s1
 VHlxN4yf1uJwl5Yl8o3J4M9Q4qoWVUwDcfsYNaG+Y8QIa2dyHvLcdbWdvZ7HBj4xlC1wSPDNlL/
 XyZ9VzLN7Ol++CTyRXPU15aKICkuVbhsqyLNfBOne2y8vSa/anIPkuh4DX43p5xdr68XrQX/VcN
 XQgeVwoZqExewaRhVud6y9N7psNGfVuBxR6ELn3RTfdM57+mG2VGjCDn6I6xvwQJqHF96pXuMjP
 WWyMXtYgoOjhPvpNV2yLBonQUch5GfLQZHMxKQCcPsNeZIwMUGFheATIYLPWJw6MusNl5N9Juyp
 8+5DWiNfMRUZl8wm/Pkg5V+nOy6vNCcgZkG4j6nvGMoxF8++lRCKVGT27XArnG0FqJz7FQZSwbD
 oVEdov/ev2gxYYrstvk9eDkIXza53CPQe6jZlBJrB46foLFzQGYuA6+cQzec0HOEFcXzZ/+q
X-Proofpoint-ORIG-GUID: EGPWUPYYWNh30nCJuika-PJXv2Gncryy
X-Proofpoint-GUID: EGPWUPYYWNh30nCJuika-PJXv2Gncryy
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686a7758 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=dlmhaOwlAAAA:8 a=tkrKlJn0stcreqTVr-UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060084

On Sun, Jul 06, 2025 at 02:32:26PM +0200, Luca Weiss wrote:
> On 06-07-2025 12:08 p.m., Dmitry Baryshkov wrote:
> > On Sun, Jul 06, 2025 at 10:31:38AM +0200, Luca Weiss wrote:
> > > On 05-07-2025 10:57 p.m., Dmitry Baryshkov wrote:
> > > > On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
> > > > > MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
> > > > > which has cx under proxy_pd_names and is otherwise equivalent.
> > > > > 
> > > > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > > > ---
> > > > >    drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > Hmm. You are modifying the ADSP configuration in the driver, but at the
> > > > same time you've dropped CX supply from the MSS remoteproc.
> > > 
> > > The qcom_q6v5_mss driver has this support for .fallback_proxy_supply, which
> > > are used in case the power domain is not specified.
> > > 
> > > So no driver change is necessary in the mss driver for both old and new
> > > devicetrees, but the adsp driver does not have this fallback, so that's why
> > > the adsp config is updated.
> > > 
> > > Does that make it clear?
> > 
> > Yes. Would it make sense to implement fallback_proxy_supply for ADSP
> > too?
> 
> Definitely would be possible, but I don't see the point in doing the work to
> implement this, to then carry around a bunch of legacy compatibility code
> that (very likely) won't really be used in practice.
> I don't think any platform apart from msm8974 are going to be affected by
> this anyways.
> 
> Still same argument from my side, I think breaking compatibility here for
> this one driver outweighs the effort/code of implementing compatibility.

Ack. You have my r-b for the series anyways.

-- 
With best wishes
Dmitry
