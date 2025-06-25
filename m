Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A0265CB2
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861526; cv=none; b=q2cGuq6ST2dl3UxdCndrtGABTdJT5PHZghblEmynLn65mFo8577S9nxUINhgLvr93bYE6XGzHAZ/rEtoKXb5FaQwTkJk2NantOKwbtqFicry20T6rC4yySeDQ19KunRbG1Z3yBA+zXsgBjsgK6h9/Gv3QVGHmSl3+KODpX46RoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861526; c=relaxed/simple;
	bh=SMDUPPCgoy4irnfRcvFwYNWDljy6PoXj9dVonnDd2qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c59EoOKXcsVwVRs9+jRnIIeWQZU4ccFZ3fwCPhgcVGeKchUkatgnkX4yKu4lK7Zvz5RZOSFZuOO9GWZviUdkkBO9AfkTwoXH8sOSyVpeUNkIcvBShs8N5jzKeoy2VVc0HuKUuqOyoyBDh0CMB14nKLhuFqwEcSmtLd/bQuhPFdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gvz0OY/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gvz0OY/N"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCa9kD016718
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r/9WVv1gsWDZO+apIRm8Vr06
	XSYUUadHkZ0D69bY6lU=; b=Gvz0OY/N0xL/7O+DlYt7P2YEtVRVSdbfx0RBJSjx
	17Ohq2EXTTAvcWyu38mbExIYiktaU1ZTWT5uDeA5D5Uwosi67mre6F6PpCKIJvyE
	K6yk0Sj9JZv4gEU8o13YHSETc1uiDrL5j6Z8EIwuXVDR7lfnkbdKp8fH2KqMZEB4
	04DQI43IrYPyzb4nqrY2jGjxX6ptgYUxhggfpbTa3lb/GPZhLrYllrKL51i8umk6
	iZo34Db3ZpycjeMaZczcVDPrMMi2wJNMvfVjPygBePBwoQVHYXLZO4S3csBr36y+
	rjMtd5FvLdYzR8YMGnzUO/mL2VL6IyEWkEO/sUwX7B0VUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqpnm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:25:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7ceb5b5140eso257012585a.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 07:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861505; x=1751466305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/9WVv1gsWDZO+apIRm8Vr06XSYUUadHkZ0D69bY6lU=;
        b=YlP63QeGb8Jax+rFoloO7NZfOI1uzD24bq+xbG9ZpH23jCVAKmAc7MKAlciRX8T9SM
         2TzAdzVALQeX19CtB/o7A4//3HXztKr4fVEDg7ZdF8jWVwLohqUvacjDXwEk6mAPyrmG
         Op2YjuOCc+HXe/nOMAhGT9Le69ZqBtE7T2xgQDTegFh8zTbB0meWIUcoy9loRM4Hwztm
         5im7o93x10+IBo5S2f9CDwBcXA/EWtNqiRKfSBxN43kIRNLWXZkEGQ3VvPkqRkLihn+g
         x9gbgqMlzo/GAPy4OJ6rq5vBOnEM6/qeikBHtDS2U07/cjHlf49hQzQd5OAVNQ87cgpx
         l+9A==
X-Forwarded-Encrypted: i=1; AJvYcCW59hpmlCIqq34oMBQ1qJefkcbVGl7PXGycne+vzuMJSl2+xZnR4sJS0PaXqBXOT18UyRXA3bpEbORqgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7asK+J7UpeML5lEtItH+Z0FXPhR05yP+Vyzwgoo/Ppu5kO9gy
	zU9FS1/4lpQqntcHlJUJ/0iumGG2mLQGKKMF9B8GzYYmC8OHCtOLUZJ5i4dKbGL1fF2BvCldm6O
	06mZVzBZ9V7rX5WQOvmhtlK+ja4eUHVfrw5O9DDw+Y6/CVH2uFFdp5vOYvVhOW7ITnQ==
X-Gm-Gg: ASbGncuZtr9EJBjrk98VhGfaZ3ZBX6s1kUXIBJlWcpqEsb33ruiuq+fc6SFea+u8dcN
	JFY7PbpefX1SUej3H0iqpENWNykH+G7RqHKNljAxQA+Njwir2U9cONZV82dgFcpBqLJQjNiBiFR
	Pa5XPOiNwW3vCi+EcDN7h/bbvJspqjZ0kBi+ZKARb3qzL7/+ORMn4TsyWaBOy0wE5qFdJuaDk9R
	O5qu8Y8U9x19x7Z8Ltaut9OzkgDkhpvrUjF03bHDN7RKAS+iM17L6dhgFGN9vCBol8ffqEn3iMJ
	3Wk1fSe1bYue1anC65I5Wy5Vw8qhdZO5SZcvpsZVm6kCKQJ8avUCs5NcmpJ6NXPf5ILa3k+8e+b
	7k+IjUrnj4b4G4nu+uedyDQDCRN0JA6HA0b0=
X-Received: by 2002:a05:620a:178c:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d42969209emr390999185a.12.1750861505066;
        Wed, 25 Jun 2025 07:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGEgmUYzG5q66jyh65Mm7bfSX8TgdMQuftg7DpsTSuzDtL/tJHOo29ywzX65LlAhePFJPlSw==
X-Received: by 2002:a05:620a:178c:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d42969209emr390992985a.12.1750861504345;
        Wed, 25 Jun 2025 07:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980f10desm18964771fa.111.2025.06.25.07.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:25:03 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:25:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
Message-ID: <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
X-Proofpoint-ORIG-GUID: DtPYmyY2CcTJ3PhI8qamZ2PL5a103p3F
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c06d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=ACp3OnxLZ-M-vqTyPYQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: DtPYmyY2CcTJ3PhI8qamZ2PL5a103p3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNSBTYWx0ZWRfXyHe9PszYPdhQ
 FGOUkZ6ATeK9ZXYSdJucChglADUkAzPZV1VWQColSb5tqNs2GPZP1CxUuCWPyAxfLKN7GKazYFr
 KpcSREwFBotsKuneOdeGNOXMn0kcd89uBNGJgJ8InJUEKb+oflh0S5JWYiWYAzuh9W1bzFMBGBS
 PdJ0gaSL+zqStFhvyim4i8fyH54OlOR64wDwabOKsoemmzWOHn+L2e0dob+0fY8NTBIaDbNXtZX
 byJJqx05ZJFZ5bQtUthgfXfPzlqhZ75VRFKueRbib3x3+YAFe8hddvgoane+FnXvXAwNlSvZ2xn
 iHPaRZfXIYB+CkevLUyGQJRX1RTLRR0x2Bu8geXgEPPmvNYOu7P4Y5L9+rO4j5I7kLbXRc6VNH0
 vgBokH392K01yV2FeK0aa94L02BvLJtOsOGgfHlxDc0zpxVqmC5nexfn434Hras97kED007J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=936 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250105

On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
> and the devicetree description for it.


Please use PM7550 instead.

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (3):
>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
>       arm64: dts: qcom: Add PMXR2230 PMIC
> 
>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
>  3 files changed, 65 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

-- 
With best wishes
Dmitry
