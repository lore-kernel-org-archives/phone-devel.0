Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032AF2F744F
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017476; cv=none; b=TxCcdqucExqz1mJFClfg6iDOUn64DXARgWpCkmoSKz/mMrKRIm8egkW60miCbAm7xc4R4hvKfX26aSJ0AXUWKpSpFv6FvcYyAkWJ/bzClzy2cWR4VUYSnBJ9Fixh6Zllv0EeWBt4HKpCGCfnyTxrqKhWH1wk9Mp6ecrP7Frs8bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017476; c=relaxed/simple;
	bh=Senl6G5y2kjgDQnYbNw5Eo8uk0FX5ScdfFCK2ebKnMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYxCKxuQFkKUz/V3iyXTxHCtNYpBx5UuNX+0nUMR2K2E3LAPkvl2DNF9+ujPpFjEx2bePy94X/v+7ntW28yHTMsfqd+bq7dmMs/U4sXhapGBQq3ma5bnZGCcWbwMkHhlTHUuQY8wnUiye24LRaY06+ZvIU/fTYEUmOoP4t/0Khg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmiW6rvf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmiW6rvf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA56vl021250
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4zWarvLQaWsU823mOnf/9QZs
	pHRdOWsN0EgD2XaoFVw=; b=DmiW6rvfu2QZrBXt1xcnd/cQeGrzTJgx1rYY1wv8
	9wJQXTuX3dFgY5AKJ1Ym8tAcj44YZKjXFinuXhy5bgdgm5o0fH1u6mRJP747fsqs
	FSryIrDKNd+F4p9o0cETFDdkss5mOlLVI+GFCfv4nqiKeLfVTvuAvKNPuGrYBufH
	07ViD+MCxAI9J6YcFnPp/4rc7dGAu5l0uAcTqcfOSNOArt1hNZqGIN5oboacPV/+
	R56SHkZHQ6vFEyyrMrjfP+GRqfu0Tn3+VLhCYUJB1dUkt/6kSno8rzlVWWomka97
	3hYW74tVD2R1m3I6tSaiPbIXboD2xKnEtkeq49nZzcRKhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1skyqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:11:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-82119c68f9bso1655013885a.0
        for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 03:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017473; x=1758622273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zWarvLQaWsU823mOnf/9QZspHRdOWsN0EgD2XaoFVw=;
        b=EcjlkXjtDPx2ah7ANwJ1I0cPBuIEB/7XQf7YXuBNlGieysYh6K6q+LZMvtIwOcd4u9
         w97/LFIKOgILUt1E8Ca/HOC9XOhPsnmS0HrqbTFpW6JZcbyNt0kLSfj1GAmyBkaxiiFQ
         7CJCXqypae3LsclNIcP5jEmY+T4hCQiIPvD18j6BpGIC1mcDZURlw7ZFf6pc9gv4HtJ+
         oh9t5ilBYF1AGWezD91jVwitgU9r9yyci2NGxPd2Oj+GWTulxCPnK5X+tbR2oqTVDC7v
         5ifA3lR+gt50fDe474Sr75gmKtoZNDmMA58b8vXuhwPoFmcuP4sI43nMe1VAIQHXByL+
         HgrA==
X-Forwarded-Encrypted: i=1; AJvYcCXSES55K71lFQVPU/sivt+f5c9BZAyOO+OAyBVhKpl4DE7JF1NS8szbyZEljTYtLMw8yCafq/Lfn/Y+AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuK1k6lhJO7J1D2jPSPsi+c+Gk8FQfJroTeM0OfUGI/zzVbSdu
	VlFVNyXrh5ecWSMdGggWXl7itnmIgmIn9Qt6CShUbQwABQaYW9mSTx9ixQnok+8qj1HC9urnCr0
	WA9KC7Z/tA2VTRUlFJQ1KYozZrBtUQD9U0JPceXdvnJZ33cjkMDVqLZZ04w3SWyxqvg==
X-Gm-Gg: ASbGnctXkPphg2uA8MqOc+19jfTo/tdLOO23t4GrXsO7nrFOtxaMd0zRWnrd4wEUufB
	Jwe+oLt3at/73gCyPFG9VKlntYbJwEFD2B2FgjZB77ukkzCmGg3UzKlztwg/jXDke0KT3XghRU6
	A7BPp9T6Yn08m6lxF4i7w/FhBO1daC8Vy9GdygPuRVdsfy3f1otS9O+TeVTwOm0jwk3x9rkw9CR
	dEoft1Pdn9B6RKNUD5Ymzt9nP+wcfcKlvOJ3zjypZ0hlX1TEQcLZ/aewyBNVI1NdU9YnvPp2qP/
	VDdxz8fFr/3VWeRSPxtBhiseOvVPIPNJaCR3f4SLEm3KzaZNlTTHeTS4asgGmbJVnCVflPBClFK
	gl+v5NPRDv4rBRjgJPVEC3hfXrapuHiJ7Glb/WSvGYw4zVWX6PhDK
X-Received: by 2002:a05:622a:4247:b0:4b7:a907:bae3 with SMTP id d75a77b69052e-4b7a907be09mr73861521cf.83.1758017472779;
        Tue, 16 Sep 2025 03:11:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2nSW+Tgo9EtUqjkqnT6uhsmX8sWmrNT+suj6UsQLiHDt68XvEFnu/O56i03mtbQPeIPMa4w==
X-Received: by 2002:a05:622a:4247:b0:4b7:a907:bae3 with SMTP id d75a77b69052e-4b7a907be09mr73861211cf.83.1758017472359;
        Tue, 16 Sep 2025 03:11:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65d11f49sm4336890e87.142.2025.09.16.03.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:11:11 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:11:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add interconnect support
 to UFS
Message-ID: <nxu3omwiy627fqubg5zhff2cnyvoeod77tlqpcz4bqfkyfewpt@ob2la5knpnrp>
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-3-3600362cc52c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-sm6350-ufs-things-v1-3-3600362cc52c@fairphone.com>
X-Proofpoint-ORIG-GUID: ari2rNviehdfznt-OMHYsp7c6xsz1rJu
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c937c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=_cXTkGicC_EJ3ct5vroA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: ari2rNviehdfznt-OMHYsp7c6xsz1rJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX2HToBrS9VIFq
 n5H6GAV5AMLnzHMlsnFBPWcpSGXQ8yVwSL+uTwxnlwgjPk3J3fnEbe4/IZgAbTYWxEJWQumvfby
 3XfRBoYlcNK9M/FdtAcK6G1cMauwxjnuFYCiMdOZqT03Yrsk/xhzbBupsrdJlnlBEzcnHAhUHxf
 hUOSlk0qI1zi55Uy9Ob4t1B2MrLkexI11qG/lil7x52vFJXwmyTdpk9VbOD1w2dYM87zVZOMgGP
 lDzuPIPX3ZiICqkxK+zttVyJ6jX2SqDIBIp61u7hlYF+00kWV0Yc0YUakRFGvzyjVhz001NUkqn
 rb2hgXYx2jjRk9tpqobot+5xZpzdvF24Ea4upmT+i0pioxKT+RaCAoRPfNhEqgGGY8+Jf6NaA8z
 2taD9KxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098

On Fri, Mar 14, 2025 at 10:17:04AM +0100, Luca Weiss wrote:
> Define the two NoC paths used by UFS: ufs-ddr and cpu-ufs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
