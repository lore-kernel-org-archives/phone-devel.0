Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C53C1C3306
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027827; cv=none; b=VCg/MQXdEwnXqYXKAophfsCI7cFIpyTl+EGoT8Ljyp6QY/KneYr9LxPruKiTJrFyEDGzxv76RoRbvlA3RFUXKRWlISS7EDEZSrEm72EPtPkPmC4OGpvbOtUyc6gtAyM41h0TebOunl2uUvwUi0JfJ1XXa7ODdes3bpOaItJbzi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027827; c=relaxed/simple;
	bh=mQR4LmdMJ5AWH2DdIwZDV3SNM0G1QHD2IJtbbw11glg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTmKs/v4bZWoVefsu2uxyBvlB0uCRZiSKrab4W2v26iv2nok6YD6BB4UeNw9bYW5ob5i+uVmhrEkhdp3PbYuMz5aol9qqTtFr1eUD6mEbDpY7h/rDmestmK2HIdQ+kWIVzSCWP8jAcS4BgWAoPqeU1fMor4KcVpwr3NxNqN4VVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0q/obrw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0q/obrw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EYqPA019183
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 16:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Z8+8ah7UIIcQ95bFrXq1GGw
	0EurOZzHp3ra6wU06h0=; b=S0q/obrwySqTy9LHyEK1stX8/lrdENdq/lMW2Pm3
	ZVwaeauTThZWRCFkJ4e4WpUAe8QAZUtU4xnoNbpPLhb5y05BLdr+9zRyIy1q7kRK
	utKaOMeiOCtFo+eyCYftTBCQ4DSNdGG807Zq4xxa80C9RspH1HcgcOdAgjE8mEyQ
	UxSo+UxRbg5+0s/8uqojx1GXRJlYTPNr2kCogM7nAgxvkwqWXEc5Y6LYje2kRs04
	7FDDMqQNSnYSk7DechME5GJ0HGM+JQM9I6GTv8pXST4uelAvUFMb9PZSkTvAY0mg
	2CWe8KQ1d8oCwh1aiBvjYVYrhrnkEB6Dh+af8s7XSDbjBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nukvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 16:37:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df7cdf22cbso92590581cf.0
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 09:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760027822; x=1760632622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Z8+8ah7UIIcQ95bFrXq1GGw0EurOZzHp3ra6wU06h0=;
        b=djxPaLuntgZB40MwCEQTx+Uia4+cK594vZ8jP8aoUCXjD+mUeGIeKiI8BKBoOOnl75
         MYX8y+CDGBUcVj6YKh0BeHmaCeQ3elynjpDoWtO/i4AXG2UbpS9zQziKI/G9fmiuHV9M
         GiWWmOA5KqGHXVTsZt8E47GDWKWS3XyHSbSL4zMQ3tAQX5OPLVS8zXx1Bu/+v0Kz/uc0
         0SAK8yaguH4c0b6i/K3c1UR4t+8yK2joRHrCzYKzr9qTH8/UwZS+Vy1lA+m7E1T/1Kl2
         8sbrMUH+v0z3wUc2KHcwnEu0dt+Nz9ecyZJJq7EcS0twUtb3Hx9B4j5wD6ig4H5iYaVP
         YFtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqxhD7SieuSKgxg6riuJnr4dFjOlFs/E1j89i1xHYAqQbdTMXRKHsLDZwYh4iilssEYGKGrU/b34SpRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj+nukgYCb08rJ9QYz0/dvPDyKficf0Jk/QiFmmxX7IYkAOdYK
	EnFtBvfdp0nngRK+ycvTtze7785IzQqTTlaREhxUoAXOlHxekCWgT05bflY4ju1OzvVgXag5zt3
	RrZAtOFP8bmwAC0sxv2LJOGbrzbrjoxG3ZDBauoSMt610QZslKqyd02iiTQqRGwA3Wg==
X-Gm-Gg: ASbGnctLyIRdShA/5++qlRboPEHwV50RHn5/MqM0nEYo4/PY0YrWJr825gh9v9bkzsX
	HzOfFiHnotpgKwWYx6TT7BdXh3tujPoGV7QfSlEV/SuqfpmXv96sFSurlJZN8jC384bEGT8J7o1
	anGJdGpa+bd589gSq6g/EMuS7bj5IcjaEYlPsqgV/lJFdJWNGhemAANwPblwBVX1rUzoqlXpEVh
	F/TCs71C0ZlAChkMFlIMOKlpqRghpL7/O6TwDK7J8WHYMFBe/eYKG0wbTJGNIBWfWFnU3CsU7MG
	lLAuxoFleSVWdJA6vADG9Naf8Ws3P3qVIr0aOWgPbP8contv4aKtRBxuTZiBxQNfGY4WXlxGJOT
	7YdXZLUXSa8t1YammYv279qmO1nZziRJn1wSt+bTUL1d8w/ne+TVqRwOcmA==
X-Received: by 2002:a05:622a:1188:b0:4b7:8a96:a623 with SMTP id d75a77b69052e-4e6de869e47mr157030261cf.19.1760027822117;
        Thu, 09 Oct 2025 09:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUNPLQ4id7eCj32iE5wNgvbzm87fPLzOkBCehs/USBPXUezx40RFlM9A3N33fdQkoKVSrimA==
X-Received: by 2002:a05:622a:1188:b0:4b7:8a96:a623 with SMTP id d75a77b69052e-4e6de869e47mr157029731cf.19.1760027821629;
        Thu, 09 Oct 2025 09:37:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac1f34asm1179006e87.43.2025.10.09.09.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:37:00 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:36:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB
 LED
Message-ID: <z4gga2ewuhbu7djvlj5xbxyxbxuqzsfrr37im7ffrkah7lw7lc@v4masjarc5fi>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>
 <rnlkxpm6crulpvfleclkszio2fms7t3ulc3rpsdozteml2bak2@zvfuyc33ohez>
 <045401ef-3a39-4b65-9874-0a0086e72325@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <045401ef-3a39-4b65-9874-0a0086e72325@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nxtW63iCr8huB5FVxwch7JLeFj4FEOpB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/ZP9rLfTlR09
 8KapWOptDLNmyN7Pb3oEzfXXUhn64U89y3TZuH8ZHCoIWbrhN+lVhm//14eAwoiJyrRG0h1IsMW
 OYwkTdiBVSNuIHOrbWcxvUox6CBkeYnGWHfy1KTb76WmHQALDYK+jmDyZex0f+2bXzljlQlbiOZ
 YbYtFm6tROuRvLn0S8HCFOe1BrmPw8kAYOSwosJyoPifPPK2uO31yai01/1nUKsA5u2WCTbyu4p
 /jGui8H7CroskuKfepXc7OyelT052BYS1QgXn+f4dF6s6FgwiJ5FqYmsEqpAVl5Tvr3TnI+d9ZC
 1EqRvENTjKLyP1z1fBzpoRewVL7WXaEOt1+5QKFEKZx8DW8u80vuuYHQJOEP1Ze/vracUR2W7f2
 QNjEhlcfGD+1RgtXBwTivQ6G0pqpRA==
X-Proofpoint-GUID: nxtW63iCr8huB5FVxwch7JLeFj4FEOpB
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7e4af cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=kLI_U5V5mifkfa6Jic0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 04:46:24PM +0200, Konrad Dybcio wrote:
> On 10/9/25 4:42 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 11:06:35AM +0200, Luca Weiss wrote:
> >> From: Luca Weiss <luca@lucaweiss.eu>
> >>
> >> Enable the RGB LED connected to the PM7350C (PM8350C).
> >>
> >> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> 
> (you sent an empty email, Dmitry)

Ouch


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
