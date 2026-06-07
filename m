Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D544C2877DA
	for <phone-devel@vger.kernel.org>; Sun,  7 Jun 2026 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780858664; cv=none; b=eyjrLTmXYDmFq4ETkt3+xz2k6VDqM5o6kX4UScej2/CcHPj0yXfgNpbrsC04jKWjoDM778lWKjRfEclcMIqQ8Y9YuHhFlz8q8KvQPsDGxlwp5ioLfR3Mo+8KQ5CAEI3i2izztgfZoqcOVbB/JT3pS80q42bt5usNXqmJfQIJDIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780858664; c=relaxed/simple;
	bh=HE97CYBuZfWh5hCXzbpTHa+42Wpq1Ij1S+0IR0PDwJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZa5VfiVMNM8HZZlN30E3XPc1JscfXdUgPqAx4oaRSp/htRAyfJSQmvdPdR6Lj1S/N+g6IbvCan2iNcxWNZZTaS+SJN8hJv6JWYenzEBP67U3gY428ZNSoXeJ9rjtyVHDikzWL6IVr9cDtQOc1DlB0beIPJzNrb5coIfZlWepxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDSxtlgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj83Gf1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDSxtlgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj83Gf1j"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El88h866306
	for <phone-devel@vger.kernel.org>; Sun, 7 Jun 2026 18:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q9Ig/iAfD2ohUcO5DV+Kt0nK
	dPVArZ9Enw9FlmNxziE=; b=mDSxtlgchbWe4fNq2g4RJOWjqZRspBg1jtzieKxH
	zpXqbd0pgH26iYcQU8pjvmLxYCyuyJB6mOfpo/uH1a4cGJL0Bqf/37sz7cgAHAdC
	NG85hDWDhYyGX2CY+kCPqjTOoBd2l8ml/WdePfORySnhpFz6vWAx3FE7WHOtzbXy
	yceI4flKh9zYa9lrKaqhVb4E821f9xuiuK2Zh1ZH8AmYTurwkBujtz87uVPRbeHT
	iGm5BFOkxvXuZLTzzbIJqkk73ldZlhg37S8k3g4ySkADQrCmUALrUU7LEK8yN9yX
	fcnds7Uk7396QU81fiFyyN9y1FjXCBmWWjNGBiG4U3m7CA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4m5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 07 Jun 2026 18:57:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ceba6ec0ccso21920686d6.1
        for <phone-devel@vger.kernel.org>; Sun, 07 Jun 2026 11:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780858661; x=1781463461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9Ig/iAfD2ohUcO5DV+Kt0nKdPVArZ9Enw9FlmNxziE=;
        b=Lj83Gf1juYT2ZHkEqmlW1aUh37S0x2rU+hA9oku/iB5aVxi8CDXDSYqjjEb1GxRxgI
         WhL+hRABtakxYK+dx0uHeRbff+qLy6tKGoU2np00usBhNihVR1s864I9FmsophJEyn2q
         TDzFkO42LPbr46MHDZHMmcmnNbU0RAQg0cnpPd5Gva9FDAoTXsk71lQV4rWfqKlJQu22
         bQPNLIttWPxqroSdiqK0P4kyXkN2ZsygfkfieZKdVGc6BFGP9iPrjomhw/xhupVOjTsA
         dMQUerkkXqBvi89Rnr3JepjU7mN/mCozYsBbXpGO54LpF2QtjWHdpB/I5Dap/JS2c3E9
         YqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780858661; x=1781463461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9Ig/iAfD2ohUcO5DV+Kt0nKdPVArZ9Enw9FlmNxziE=;
        b=tPo9nTWebW0XtGpP9uHSyO1VgmcL3Mnq/A0hLpJuFH1H17h48XILlbweTVEILITORV
         mGfgauCvdIrFRJx2jbulhsxqJqQeD+z4m/aSYB/TFRQlGJIJsicBB6z0SQo5y51aUP4u
         q2CKqvRxYYAT1tcmtQbd7800iz954OwAKYUGjNIsJ26lMa5VbScQdIMBjBH5LhQJe799
         FXIwE9nUgg6pJ3Zq6mYPeZ6Gxi91+PgUGLxz3ibxizqP82HLkA6ndNp4QXDTLgfjsYMS
         279/Ic98R62wV7jFQT+hWN8UITQS5E1b+xilTUa/C/s7jYlolzKu1lE3vh0R2I1OfMqF
         FH4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+NWimcRsThuro1qlzQdBhxtxSxiBQ5LW4SjItoqZtR6zczNKAfgHzWc+Okfq9LtiSjX3O52kBbp5y85w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgt2aoc2Bwdyo3Ehh4yNmegEvz2+xdWXy2zvo0DUwZk+8FE0Jr
	bHxo18RBpe/WarzacBoGBc+p2C3+Z1m2HaXW7lF+GNhk98PyDOeddqrZ+GwdEn2fNC0G9Pz5smc
	LypMHnJu8zwBW4DmM37D28Ot4IffqYlX8faLXwMMJq6jLV0eGnqsDQ0F88SInEKZD5w==
X-Gm-Gg: Acq92OF0OhX8bcGX9US4rFO2J5FT8hsAbLRGWNhnYnvGD05vMwNujC4Kbw/Q0jkPLF3
	ANGcclKU3gbZccWYNARV3s5wubVDFDSB1kIyKQFyfhkVBvmdIMPL6W2eZukA6Q+m5JXurjs05ii
	/BGOJJeML/3w6Q1VtddnMeWghXB4vKHw0mXVr6e4Nv0PbJMTZN8V7/PgzN9AKU9sL6mv1R/jHKB
	kDOa+w42VeSx0BeAAj7n06CWdZBTWMzAnB5K5a68sStBy6v4VWV0/zZl2/JPGA9ILIAKcW+HsAM
	D136a48MEC11f/Icn0j9CMM8eNRZir0fFuamVUkTrm0ioxZ1z0ZXcntfDLEv+WT5SG240GBlaEL
	qljUYET3hanU0cc9FT+RGAnDf2esDv2mmKU5t7WOf7KRqXNj0/UTu4USBixguY7pPkyBiv2llKj
	YsTgbWWeZ9F1TQGzBO/L1NQ+xaEDsxLfh2eqFMImwjwlS7rQ==
X-Received: by 2002:ac8:7f42:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-51795b8ef04mr191324091cf.18.1780858661148;
        Sun, 07 Jun 2026 11:57:41 -0700 (PDT)
X-Received: by 2002:ac8:7f42:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-51795b8ef04mr191323771cf.18.1780858660794;
        Sun, 07 Jun 2026 11:57:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2e9a9esm39513741fa.36.2026.06.07.11.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:57:39 -0700 (PDT)
Date: Sun, 7 Jun 2026 21:57:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcm6490-shift-otter: Convert fb to
 use memory-region
Message-ID: <bmvmi5tomnndpmk4aohv3d4guxjfbea4nckljawk6ez7ovz2hk@sshjz2ynd5ba>
References: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
 <20260607-shift8-fb-v1-1-72b9dac25f4a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-shift8-fb-v1-1-72b9dac25f4a@ixit.cz>
X-Proofpoint-ORIG-GUID: khYsRnjLH3FqMDVH5OMUCa3FXoKcgHtJ
X-Proofpoint-GUID: khYsRnjLH3FqMDVH5OMUCa3FXoKcgHtJ
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25bf25 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=NdoN8BoSjOhuqMYtIe4A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4OSBTYWx0ZWRfX0DU1vTIHm9/E
 FhAdIUdlJEsKTFVLHQtCVgKxf8OCrQoaZvm/T1Dho8+QdyNj1rCBoYvW+VgDKP95wxE5Q8Magg0
 FKxIrd0WPGSBBWK6wMaJfDspSJXYOJFO7BczyEtosbkXUDU50HskV6ZjRhIywmZOLKmA5JcrLUf
 bWVCyvBL9LBywyMEgcCMmV+Jc/HXsaNn3edJIYkkg2CLlH23g0LuAeunY87l98FcSdRworBwzUs
 /EB6XVQa2nyONPeyWqlIL8QcWYVOuBztNcw4z9tPI0F/+FtUnPJv0L+z+RdezaHml1pUDZWOXNr
 LbfXaSc/B7ilvU9FPUhAWBIzdhfOyDY73J17EmeGzhedWpM2fPswkRU3ryhdN5mINyqd7GqizWc
 Bk00nl/hW5tOOM4uT1BeJZDfdtNgIRUGxZkkrf//Wl4gmvtfeMudOpNMVfi8zd/3/nh0fXldX6N
 wd0RQGXXHmBBfg1zn6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070189

On Sun, Jun 07, 2026 at 04:12:18PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of manually specifying reg, reuse the memory region.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
