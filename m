Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1444A3B1AB
	for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751125818; cv=none; b=fRLf3vuX4omZYUdgnHxJZy9+C0+eh12HDSVcVFYJHcGDFoduOI5zsfv9Ooo32qFyZE6fJIP3s/2RpmNPL+l99RmZhflSbIiUSOgXvQ8Tp+G/QEp0L+2IzHQmlgfEc2tehVa4cwuisOb6oaQ+VkiHSYrLdG1Tys1VDY1suRuT7N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751125818; c=relaxed/simple;
	bh=UhdyBvWUdTzq9Tt5CDP9Ck0AZU7LvAz9Un6yPjcW9Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHzVTOaIHZPf+6rSQ8/Kf9FR2QFLTA2fSOHP8keZPbo+7p9qQahsYNNuAemHlq6YxQxvBn3QJAE7U5tPEUNIdEz5141txIGnoJTBYOzDBE9eU13ksVTc1n1kCc/ykruatl5TW6/BAYaIl54W+lqD9AIF0T6oq0uwN7FISftRycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7By2li1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7By2li1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S6M7jh021685
	for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 15:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eWdrwLiaH5wIgAqjHd2m4i/B
	poO4mO4jKXqkdUUaYhU=; b=B7By2li1GNB72N13F0O4kwQ8l3hqREd2hocKNCAH
	5F2Qnki+puRtJ+kshqMy6IvTc549shFPDBZhdsKudvNL+yArE4lnTyoC8hwF6Oet
	OfzqAVt3ujL/tST/7m86L/C+lFysuqiL+K88jW6i/pehY0yCmv+yZkmHvw4Gkv+u
	nnPq7XyJCCTVJqR+v9jL7+2sjNVBodfqhupiczCGD76XHB61psa6YauosrAfwDhk
	VdIIAWsLnyVuyXl0Bb75VRG3kdzyYrD+r+kI4Rabb79V4fzzLOHGL2DmStqLw97B
	KSiyXZeU/jZOh+YJXo++2ftVsAqj0IFcqhlie2AX81z5iQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s98t12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 15:50:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09bc05b77so136272485a.1
        for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 08:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751125815; x=1751730615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWdrwLiaH5wIgAqjHd2m4i/BpoO4mO4jKXqkdUUaYhU=;
        b=PoP45bz942fG3bic0X142wAc4XbzpQdCO03U/YCKe1HNBpnCKGzgMcjLqNnUwLYTV4
         DXCGZewQyIOh8m8gBGTvIFCJzb7q3Ynxng24NHRRXh7JXGog0HNL176vUEFcoDUkew7O
         pc/yDjnKPFTwiFS/FvtmHqvY6tWtNq8uQ7y3xPRLyiTLWqVNO6gMslcGNv4aRvnyaCkc
         fac9W8jho64X+d3KEjorFuQMV7WtG9Q+Pn0Xa9LqAyCwWt4riDzRfqB9fcYvfHPYqGWu
         zesK+aP4VrzYnVW6UVbwykLq63kg3zsmC0mfZ7CiyxbcxLYlMU3LnbLzVjmKf9emJIHh
         omcw==
X-Forwarded-Encrypted: i=1; AJvYcCV86pnjQJilkt4/FTTngEr/vQ29qFhMnWMKX8vQFMw0Ek5TDBAEFCKvbNiXY3ZzhCFX3FAXcWjqwqxZ9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0MR8f3e1UAxnySXw6MRve3av12etOT4qc/vC7ZIfT5iEwcY0A
	NbqttCN/58Nz10wlz+WnT8/Bt5Af8f3mMs5BIJXjAUzPQei+sHa0Mlrn28vyjXPFui2aaIiODN0
	+f2PcUM0GaFqaNpWxT0zkn1nPz+D5ks0XXmYhrP39qBCy0ob1Kxs9GGHr8Mntl+JBug==
X-Gm-Gg: ASbGncvsZXPnYUObJC/ZlNOEmEA5FYgMUgoiE28EZMcuwCbMruQkG9cxyKjA/mtf493
	2nI5xLmZJbzTV+I46ctyQWdi+moEVxaTaROv7Ymsx0mWg3PUpZgXI/O0cxJiadauGpC2ZcqpBTd
	sgNycPGQFYtRVI8AcRU9iEGRLbhyX1yjGucE3jSin4hj8HrHBDF+yKrT8LIdsnHFjOdh2P4mxnF
	TKN/t8wkiFdQHyZS6SPVPcFBfqXFYSkZ0fKAIvY4JYv4/t14ySfZfv8RzmcOmhAgfQVi0P/o9uh
	Tnsqu52mgd5im7rgfbg7iO/eiMwj3/9gB47ZhoQ1te3jRd6p83Wp0bGzHUaneBotMxb9n+M+dwf
	3ypKwhyZiezjz/NXntalicS/78onHjXHdOCQ=
X-Received: by 2002:a05:620a:1b8d:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d4439a65femr891492985a.34.1751125815018;
        Sat, 28 Jun 2025 08:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXHeHAR3jro5JwVkyah1P0tVqO4Nod5yvizT9CIaPu13zn8ai+/6N0tztx2GTOOd7HbCGs/Q==
X-Received: by 2002:a05:620a:1b8d:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d4439a65femr891489885a.34.1751125814642;
        Sat, 28 Jun 2025 08:50:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2edcc2sm842664e87.238.2025.06.28.08.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 08:50:13 -0700 (PDT)
Date: Sat, 28 Jun 2025 18:50:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs
Message-ID: <uzohbx6rzv5wmo3c45pczn5lory7qwhqc5ixx5wdnvdbzemhvl@edl7dddvruly>
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
 <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68600f37 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=4BQ2PeVRA74-f4yG9uIA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: wdIBDy6MnW-6wpLwtKis-CeQjsDqWy6G
X-Proofpoint-GUID: wdIBDy6MnW-6wpLwtKis-CeQjsDqWy6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzMiBTYWx0ZWRfXxGV16tQNKeHA
 nOdCABkHh0NE2KFYFLHjLLMzFSp4GbkUts9RdpgnWA/9/tgpvPprBeS3uZSyhn7xjqk3i7eqCkc
 sCuaY6vKwN4RJ/bKKtqngq3KmM8UMHnf528ukpJ3mSY3bQl5Yn4Sftd1vFE8zjBRzeKTIrAQWyW
 CbRdBfcX6Ln9/h6T+utfr2P8LqaQ2NQJ5BkbGoY4nGjqvY77fQX6bNYncrsNXq1BMm8sNVnRPzg
 xBs6NPUCMWLxW/1r0lgIOYoHyawqD26wfW8Qk5IGqY9nQUVpkHxlEo2/8NZ9H0lzfsbhd2lIEb0
 cBm2LQYs8zluuhiuUppoqbH8/2gNRvdTi0PT56aL+EiIu0qThlYSDxDy7BsHIJfIUUU1NE+M2nQ
 LXoNmyIfJNS43iz/rg6wRXch84RiJg+n3p4ZTieP1Us1X1/t6v45NN03AniGJEiduD6BMZCS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=802
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280132

On Wed, Jun 25, 2025 at 11:11:46AM +0200, Luca Weiss wrote:
> Add the PM7550 and PMIV0108 to the pmic_models array.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Assuming that you've seen them in socinfo:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
