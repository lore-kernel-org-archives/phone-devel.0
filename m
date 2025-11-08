Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD925B69F
	for <phone-devel@vger.kernel.org>; Sat,  8 Nov 2025 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762624092; cv=none; b=uTfWTveYbp2/mDdcB19lUcEwU0kTemHasYer6hdGa5ucY16bVR5QfE7zPVqT7TAE5lV00Q8mhKZfFdZqnIknOK+S2Clr0naBzpo7rM7z+8VHsAth6TUVcgVC2gmWu/jOtPEGYZx+0pv9KDskhn5JS5GeAvy8n8bSSy+G0vGKCZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762624092; c=relaxed/simple;
	bh=8AtMYJ5TBcJV6ZqE2nZp4MZjEGY6MVYzWwV8mtEFQqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIlKcsmIZCqICNLqRXgaxKEwzxy1+vmjpyemd0HTtEjty3NWxKZEdEwJPMAnnUqF1C7sDAFZNZSFJ/wnAVyNSOpIjCrSTlkxZGiW/NS1cBccyUcxEUnpOhfSCjqNoksHvMMuzGfmfq5/BWhimqgcxf4cJqcB03NCzqwZOX3Vz8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g68LzhRt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iUoUnMU7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g68LzhRt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iUoUnMU7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8DTSx21790386
	for <phone-devel@vger.kernel.org>; Sat, 8 Nov 2025 17:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oKNhA/wnZK5tHj2oJkGCMVi7
	EZ71nQgfta75KSMGCxQ=; b=g68LzhRtyWGyfImi5Zkj3mqRSw6GB6co+LrfxJMX
	X91jKT7rJJFJG6d0QvJ5GZ/K7ZEVahc3F7JGqEYQWTQcAZn26XjZ6xVGUoExfQUy
	oRCpQG5yqHtaxeYNIfz1T0mQf+J0Ofrs1gyXnXfgSyQorVpBmoT79cguC/3RNysI
	z4HNru0DlCJbdM5fFbwq7TNgUKAIn21nN0WBbEGOA+Q2FnqYdHr5qcPCUrMR2BYA
	mEkGUC4bp0FTP9ZsB1ECV2NAILg7/6d+Gtuqartl4j8WlH8Vbdf13L00Ip4AHgE1
	ydtj1nqLDPamLFdz6zTkUhudYJfrjwpF1yBQbzOGwPFUuw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xs78ybh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 08 Nov 2025 17:48:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8a4c63182so52563061cf.3
        for <phone-devel@vger.kernel.org>; Sat, 08 Nov 2025 09:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762624089; x=1763228889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oKNhA/wnZK5tHj2oJkGCMVi7EZ71nQgfta75KSMGCxQ=;
        b=iUoUnMU75uBHKmEbeBYL+Ay+SE/pybWnoILFvRZDwlVx+c/XhdpGtRKjYEs58zDFUv
         pjJuTRsN8M0lhQJGQ3QWg+THQiyao+ClY2oEfwyJSzZDZLWjlj5CfFHsOn/JiXlQFVPS
         OMdHZ1qMPJteylqT/gPPyn+KuKSPHqHjpU5XAy6448L/MuymWvNe7anOuNlljX7xkiLZ
         Fq9B0imwpdL2RK9UeqbYurGBXi5W3uEOZ+LqHkajgthp/lITTn3euWGkj+iX45YVR7fM
         nWxYLI6mLu6zDtVISX9b57Eo3ZYOgc9qhMpJeT5UpEHglepJUEim0RzkQatyqeAC0x8J
         5zcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762624089; x=1763228889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKNhA/wnZK5tHj2oJkGCMVi7EZ71nQgfta75KSMGCxQ=;
        b=XjdNqHyGeV/xSMPzvewbh9fotSKhTUSdYe6TDcEdoxR95jSwMTUCvlP/S+dRTbYDpd
         k90C13qWMR33Xb6go+KBjxFum6mYobOWz5XrclNvWXwU1lwnKhvWMhuGfBI1xJoOu5Lc
         fT97/JkMuf4oSZk8aLpwBoR0KCSf2muNSfog2Ym0Ipu3cQUaOc7s4tdfWdGFblppqflh
         JxaadzE+x6r/XEp165CqmIL0jRc9OzugtFouGXlFOMqKNq8su46tyhjzCVgeeUdu4hpD
         gxDWvwZZYh5j9vasbYP8hBZHAHm/ZWRjRUt319wvMhfTRUbj8LpCNPMIJvBPZhzWOxtl
         E2nw==
X-Forwarded-Encrypted: i=1; AJvYcCVFrYZFlWOKGiF4oJTpaFIlzueENyc8IEWb6yh8Cgb1fRaGho1hES/NfCNEf8mzi3J6Kq6E0ytLCgRsAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3EGgUlmLYionCZhYBRAeGhx/NbnGOGRAeFjnUkyfswN+doRH5
	3xKFWiPRGvV7F6rzKNlEwjDvNEPsyTNSCRJ43p0rN+qDi0bjBxmABakXAO2Q8XzG7Pa5IhyHvNI
	sUCnbaQwZDILVFs3qplZNEjwuT55ARho+Hmj53IDmTH9pQHAJdDzKk+ThXOMCiGIeObjP73WaSg
	==
X-Gm-Gg: ASbGncvlfR+4iJaYMjiCWvkXcbXnygqiHxx9uhPxvHaXBKI4S9sAbiJlvd7zORT2G2W
	ywmSHl+GnfP6oJg8FcD81OP4id7K9GTPvv4JWgz3cO0b/9AvAh1jm+UO7XbOEWwIrqvPcSJrAMw
	8tWxCfZwSZTT91rjsNzXFF4bCMTth3m3FeuSDlGfMSr3wL1PqWVUEJhk3ECaQZ2w06S5bjDId+N
	K98WeeZhe+fRh0wJDI7UHRiy83Db7dk3ppO9gVbTqTVPp/227UeKkGxYfQ5BDb9bEPPoL+ObF4y
	umC4EUWXfWs7d6ECc0cWNky6n7ri4Flx3wWoadTGDwy/vheC2eUkrTSavhTb7OEa/YMt2icSIlk
	E0VX2iYWvSbxukdAx1GXhiwi01tUVyB4diVYt5fzle2Ut165MHNaSiu62+PVgp+q7y87bvF3b+v
	zaQictMld60tM5
X-Received: by 2002:a05:622a:130a:b0:4eb:9f37:9df0 with SMTP id d75a77b69052e-4eda4f09bebmr39398581cf.35.1762624088804;
        Sat, 08 Nov 2025 09:48:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIsSrvfAIAazMR3+R4mtJZyAwKCCj0ixIasuIj+5F2b3mDr+MWrB7+JvGQoEoO6wGCxfnb4Q==
X-Received: by 2002:a05:622a:130a:b0:4eb:9f37:9df0 with SMTP id d75a77b69052e-4eda4f09bebmr39398301cf.35.1762624088398;
        Sat, 08 Nov 2025 09:48:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a019cc5sm2334971e87.27.2025.11.08.09.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:48:07 -0800 (PST)
Date: Sat, 8 Nov 2025 19:48:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] interconnect: qcom: sm6350: enable QoS configuration
Message-ID: <7anacd4dajb56nsr25mjjd72deiezzzqxewhrrayo7btl5nf3i@43pqifo2pwd3>
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
 <20251107-sm6350-icc-qos-v1-4-8275e5fc3f61@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-sm6350-icc-qos-v1-4-8275e5fc3f61@fairphone.com>
X-Proofpoint-GUID: j0c9eBeb599S4EUb2_iB8GYAiqMa1NnB
X-Proofpoint-ORIG-GUID: j0c9eBeb599S4EUb2_iB8GYAiqMa1NnB
X-Authority-Analysis: v=2.4 cv=LtifC3dc c=1 sm=1 tr=0 ts=690f825a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=nyvGelbgox2M8jkpOYMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE0NCBTYWx0ZWRfX6ky91xqSAFXq
 Z97+f2yDlptQQ355wAAUtG3KBpH7uQ2HOX3a5Jvz/+QUOl04rUVsPEVLeDtdOOAz3eC/HiOwhBi
 MFihrsv/coZvhydQPIquH2yBA/jKkzLpuB40xXcpUPe6pHFUGH8mR3a7iNe7nNKgdFKYnG0MTuO
 aRcxrOG17BRZ/HflNgzlpwpWMp4Hv1LImEExyqjHyKzJ2GJWYv2bsuM3+dyogUhdusB4ixxZmfh
 gjOIO5puz4+SDW85mUk9iig9Z5hedEj4Vg1Y3IjRFDr4MU9lGVfKDWMwuyIpxBXSA3wQCVHKSlG
 cG/Ar1MT1vjhTvy4Cb64/HK9VXvwKu236E6QB4pBOEEe2BXd3YbB65Q0dJew+h2MtwG30nI95Nw
 WZI8XOhmbJOv7SMgQc2KGmiFDOQJiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080144

On Fri, Nov 07, 2025 at 05:08:50PM +0100, Luca Weiss wrote:
> Enable QoS configuration for master ports with predefined values for
> priority and urgency forwarding.
> 
> While this does require some "clocks" to be specified in devicetree to
> work correctly, thanks to ".qos_requires_clocks = true," this is
> backwards compatible with old DT as QoS programming will be skipped for
> aggre1_noc and aggre2_noc when clocks are not provided.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/interconnect/qcom/sm6350.c | 288 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 288 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
