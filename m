Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BFE2367D1
	for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753297403; cv=none; b=NUUb0OZSprEciVdpQMQooVqiwr1arJ6CP4bIec5DxGqEhGIsQb2AYO1cUtURzBkrSFEPlI0PbxLJzEf5FcLi2C5XNTWGp06uptkd+LhmME2uKQMVbQF1rF3BvTjOQEeAbZWRRjLkc2Y9iy7VOduXJtx9957/av799cF2R5mwi/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753297403; c=relaxed/simple;
	bh=5ea0Z5iW73aQbfmp3MXeFXInCTR/m6Xn6x8V3w9GG+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqrUgOXEOSgkAd6g80pO4Q/OUb3mstY3izvaQFMcy5pNXbhQ8poIziXbgVRj9kbMnPIdM/ySZJwoUQe+sJU/sTzjWzG1ZHj7qgPvQr5BBeEvHh1NcfsJyxdiY8Twb00Kx91l7T+K1X3qNHtgpfMIYUqff8b0lj+u90DBxhMRTtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QI+dBWLr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QI+dBWLr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGNfJe019560
	for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 19:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3JeOLC/VutJgCxJf2dGFWjbm
	lsKNIl0elH7h0M89g/w=; b=QI+dBWLrdZXvYiJUQm8wJwIKWRPJMfS2lDB6PdgE
	vBEfa9P8C8kQ283BY4qbgd6k81mgh43p0ih6ufhVACuL+sMXXCpTBjpSG98zS/bA
	hH+o0/6XfBCUUgTCqX1pcQRTpOLn6yTdaq5oOYfsUn/HUs7puTtfW3E0omVpLwgM
	JJZnsClG6u/qGbUrkGwZwT/F8ar71EaZGnYYfn4k2cgVKWfOd00llIBqArDSg2+s
	53aERgpWRL1paTOKSzOxtAwM421zKtXEFhxRUdUp+cnGFtrdxgQ1SwqnJHapASXo
	/jNpKxVSnwGQH9H1OO6oFverNyon8UQQMd9KTdRgpxCCkA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379rdje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 19:03:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-702b5e87d98so2771226d6.0
        for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 12:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297399; x=1753902199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JeOLC/VutJgCxJf2dGFWjbmlsKNIl0elH7h0M89g/w=;
        b=pFG273HSonBCVCM0gNyLp8OYmd+ddKGxajT0plYFg16kogoFKRVlH9+CVvYh95OICs
         OIZRFbdFLkDVZL2nLrs578QbarA+hWGf8x/knixiz0ArIYNBiFUo2ZE22LsLSAzWOl6N
         v9KucVAwy0Yzhi/KCrPETalH6YaTBl3XZNsIYHHrFlYCgzdUwPqIkrMyggV9/4xZ0egw
         ExgLW9oCbbvYRuybap3rigwarFdRE+tY+jld1Hzk+2R5OQZDCCzbg9csSwktkFsEKbUO
         e6X9ULOkhI2h6Fl8vbFQ4QkT1AIvY9VL1ncgz/lZCQk09CHvyeUAwdVueMxdELhCxQSQ
         PZdA==
X-Forwarded-Encrypted: i=1; AJvYcCVtNqDShKBQwb8o+CpOTynBZhc8sukz0NdWMmO1eIjXRatTxRWiC9IRZqNr4ktaIJNZ0Om/+Drxjii4dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNI2eXeQ6AWSqAAzVXQNAl4wLmJ3/LlBUW57uOYrjXkHMQr9DJ
	6+Amg1yz+wp779DbwWHHhdZpnFyi/A9Y3Qpc9ObhW+3eaBhai+Q0vLIkYbJM5RtmpLdDnB4W+3m
	YKuuRDXsSfJ03LyCfIAaIlR8Zr97DpefCYYfHdiHq77XHf1dRwYBuA6Co0NVGEHR2KQ==
X-Gm-Gg: ASbGncvK0qVfp4MGXtLSwPN0uR6IF8215hZsDrDnej3U2knW/7xzwHTJW8MMVsAOYpF
	/w7nxd6zgEIa1p93L6PCEH/dvdHdeqXgdLKmZ5odACweDOjPlNJ2+wUJuqKvWl4oYE0nSOioRxB
	UE2fz4K+14ooDJw0sQE4SKNioJ5+o76eID2B0by0Y94wf9l5EnguGh/CvebPfTG0iYF3YsosSQC
	u5RZ2xurG0DLfeQMMNEkyorU1scvCmdKUhT+IXfs+Wgsu9iAVenex6/vaJi4BHfI/O6dthxOTAD
	42saQFf44R99z/LH/D3SMblP8XCaQoleB5D7i7U9r6toGMeyJM61BMq1D1BlZbe8jRiGTatbAhd
	o9xlR1uoTuJYdVSELxky2Kz4TNfHUvFAse2NHTctkNI0qLROYngP9
X-Received: by 2002:ad4:5942:0:b0:704:ae41:df2e with SMTP id 6a1803df08f44-70700789c2bmr52781736d6.43.1753297398656;
        Wed, 23 Jul 2025 12:03:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsaankh/5EYi7v0dpnHuuH5wHWyyjdX2jkQSgmx1+drNNrAFDbQTC/0KMBPqf+Exsye9uSCw==
X-Received: by 2002:ad4:5942:0:b0:704:ae41:df2e with SMTP id 6a1803df08f44-70700789c2bmr52781206d6.43.1753297398112;
        Wed, 23 Jul 2025 12:03:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1475sm20370161fa.53.2025.07.23.12.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 12:03:17 -0700 (PDT)
Date: Wed, 23 Jul 2025 22:03:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: Add missing UBWC config for SM7225
Message-ID: <blibzpqgbjbbwvnsx3cu3fzjxk776lamnmd4erokc5jx7qkubh@7da6ihmb6xxj>
References: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>
X-Proofpoint-GUID: Gl9fy2JWD-i1Ha77BPB7_sjPH1da2_Sr
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688131f8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0w4he5-zLxu2L8T7xFsA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MSBTYWx0ZWRfXz/n8j0lzUwzQ
 gKwb25jgkNi4WtfBybURlVMt3v2RxyrYmrRiiKaZOY7oTegOv1vIvG1SI7mNrCoo35Y/+j8Sql8
 saUOvEBesum+LBepGH8g4GQPXBKbUR4iUi8GHHhlShY9BHkkCWGiNrvhTuipiDkTufUhJXHW1Ln
 hwOBFyvQxnlo0Cq+if5uWomRaoHR+1P2a5C6bg8JLF2lVAkZ21bH1EW+DkoyMkKj3nZuzUsK8kV
 LGMY4izn2hW4xEsPS4NsXYo5e29+rJ2SaSMHYgJKULkY0pma6t0kUJ6XEXUTF6cSKvzbRJ/xz5E
 qqqRKsZy3RMHsKIyhDnKw7hxAQlQUHd51dtn+6u2U7IHOvU90cqSPfnxx2teOzFEEtlRG/baJlg
 TKMD2/nkGYDPK5WcNo2OoiMw/rpmoV/GVZYCl3eCn+1XfqAd5Rz+gGeNb/7xEMrvH/D9S76U
X-Proofpoint-ORIG-GUID: Gl9fy2JWD-i1Ha77BPB7_sjPH1da2_Sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230161

On Wed, Jul 23, 2025 at 04:19:22PM +0200, Luca Weiss wrote:
> SM7225 is a variation of SM6350, and also needs an entry in the table.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Note, due to other bugs on next-20250723 I couldn't fully test that
> DPU/GPU are working, but this seems to be required in any case...
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
